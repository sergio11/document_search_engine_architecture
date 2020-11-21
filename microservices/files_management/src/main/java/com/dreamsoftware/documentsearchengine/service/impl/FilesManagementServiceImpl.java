package com.dreamsoftware.documentsearchengine.service.impl;

import com.dreamsoftware.documentsearchengine.config.props.SFTPProperties;
import com.dreamsoftware.documentsearchengine.config.props.UploadProperties;
import com.dreamsoftware.documentsearchengine.service.IFilesManagementService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import lombok.RequiredArgsConstructor;
import net.schmizz.sshj.SSHClient;
import net.schmizz.sshj.sftp.SFTPClient;
import net.schmizz.sshj.transport.verification.PromiscuousVerifier;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ssanchez
 */
@Service("filesManagment")
@RequiredArgsConstructor
public class FilesManagementServiceImpl implements IFilesManagementService {

    private static final Logger logger = LoggerFactory.getLogger(FilesManagementServiceImpl.class);

    /**
     * Properties
     */
    private final UploadProperties uploadProperties;
    private final SFTPProperties sftpProperties;

    /**
     * Save File
     *
     * @param uploadFile
     */
    @Override
    public void save(final MultipartFile uploadFile) {
        Assert.notNull(uploadFile, "Upload File can not be null");

        try (SSHClient sshClient = setupSshj();
                SFTPClient sftpClient = sshClient.newSFTPClient()) {

            // Ensure Folder For Uploads
            ensureFolderForUploads();
            // Get new file to save bytes
            File fileToSave = getFileToSave(uploadFile.getContentType());

            logger.debug("File To Save Path -> " + fileToSave.getAbsolutePath());
            logger.debug("File To Save -> " + fileToSave.getName());

            // Write File
            Files.write(fileToSave.toPath(), uploadFile.getBytes(), StandardOpenOption.CREATE);

            // Put File into FTP directory
            sftpClient.put(fileToSave.getAbsolutePath(), sftpProperties.getRemoteFolder() + fileToSave.getName());

            // Delete local file
            fileToSave.delete();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    /**
     * Private Methods
     */
    /**
     * Setup SSHJ
     *
     * @return
     * @throws IOException
     */
    private SSHClient setupSshj() throws IOException {
        SSHClient client = new SSHClient();
        client.addHostKeyVerifier(new PromiscuousVerifier());
        client.connect(sftpProperties.getHostName(), sftpProperties.getPort());
        client.authPassword(sftpProperties.getUsername(), sftpProperties.getPassword());
        return client;
    }

    /**
     * Get File To Save
     *
     * @param contentType
     * @return
     */
    private File getFileToSave(String contentType) {
        String name = String.format("%s.%s", RandomStringUtils.randomAlphanumeric(50),
                contentType.substring(contentType.indexOf("/") + 1));
        return new File(uploadProperties.getUploadsDirectory(), name);
    }

    /**
     * Ensure Folder for uploads
     */
    private void ensureFolderForUploads() {
        Assert.notNull(uploadProperties, "Uploads Properties can not be null");
        Assert.notNull(uploadProperties.getUploadsDirectory(), "Uploads directory can not be null");

        final File uploadsDirectory = new File(uploadProperties.getUploadsDirectory());
        if (!uploadsDirectory.exists()) {
            uploadsDirectory.mkdirs();
        }

        logger.debug("Uploads Directory -> " + uploadsDirectory.getAbsolutePath());
    }
}
