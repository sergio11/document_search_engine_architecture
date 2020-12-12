package com.dreamsoftware.documentsearchengine.service.impl;

import com.dreamsoftware.documentsearchengine.client.IFilesMetadataClient;
import com.dreamsoftware.documentsearchengine.config.props.SFTPProperties;
import com.dreamsoftware.documentsearchengine.config.props.UploadProperties;
import com.dreamsoftware.documentsearchengine.service.IFilesManagementService;
import com.dreamsoftware.documentsearchengine.web.controller.error.exception.FileAlreadyProcessedException;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import lombok.RequiredArgsConstructor;
import net.schmizz.sshj.SSHClient;
import net.schmizz.sshj.sftp.SFTPClient;
import net.schmizz.sshj.transport.verification.PromiscuousVerifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;
import com.dreamsoftware.documentsearchengine.web.core.APIResponse;
import com.dreamsoftware.documentsearchengine.web.core.ResponseStatusEnum;
import com.dreamsoftware.documentsearchengine.web.dto.ProcessedFileDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;

/**
 *
 * @author ssanchez
 */
@Service("filesManagment")
@RequiredArgsConstructor
@Slf4j
public class FilesManagementServiceImpl implements IFilesManagementService {

    private static final Logger logger = LoggerFactory.getLogger(FilesManagementServiceImpl.class);

    private final UploadProperties uploadProperties;
    private final SFTPProperties sftpProperties;
    private final IFilesMetadataClient filesMetadataClient;

    /**
     * Save File
     *
     * @param uploadFile
     */
    @Override
    public void save(final MultipartFile uploadFile) {
        Assert.notNull(uploadFile, "Upload File can not be null");

        final APIResponse<ProcessedFileDTO> response = filesMetadataClient.getProcessedFileByName(uploadFile.getOriginalFilename());
        if (response.getStatus() == ResponseStatusEnum.ERROR
                && response.getHttpStatusCode() == HttpStatus.NOT_FOUND) {

            try (SSHClient sshClient = setupSshj();
                    SFTPClient sftpClient = sshClient.newSFTPClient()) {

                // Ensure Folder For Uploads
                ensureFolderForUploads();
                // Get new file to save bytes
                File fileToSave = getFileToSave(uploadFile.getOriginalFilename());

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

        } else {
            throw new FileAlreadyProcessedException();
        }
    }

    /**
     * Delete File
     *
     * @param name
     */
    @Override
    public void delete(String name) {
        Assert.notNull(name, "File name can not be null");

        final APIResponse<ProcessedFileDTO> response = filesMetadataClient.getProcessedFileByName(name);
        if (response.getStatus() == ResponseStatusEnum.SUCCESS
                && response.getHttpStatusCode() == HttpStatus.OK) {

            final ProcessedFileDTO processedFile = response.getData();

            log.debug("============== Processed File to delete ============== ");
            log.debug(" Author: " + processedFile.getAuthor());
            log.debug(" Language: " + processedFile.getLanguage());
            log.debug(" Mime TYPE: " + processedFile.getMimeType());

        } else {
            throw new RuntimeException("Processed file not found");
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
     * @param originalName
     * @return
     */
    private File getFileToSave(String originalName) {
        return new File(uploadProperties.getUploadsDirectory(), originalName);
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
