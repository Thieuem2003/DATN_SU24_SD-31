package com.backend.service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@CrossOrigin("*")
@Service
public class FirebaseFileService {

    private Storage storage;
    private static final long MAX_FILE_SIZE = 200 * 1024 * 1024; // 200MB expressed in bytes
    @EventListener
    public void init(ApplicationReadyEvent event) {
        try {
            ClassPathResource serviceAccount = new ClassPathResource("firebase-service-account-key.json");
            storage = StorageOptions.newBuilder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount.getInputStream()))
                    .setProjectId("shopthoitrang-f941e").build().getService();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public String saveTest(MultipartFile file) throws IOException {
        // Kiểm tra kích thước tệp
        long fileSize = file.getSize();
        if (fileSize > MAX_FILE_SIZE) {
            return "Kích thước tệp vượt quá giới hạn cho phép (200MB).";
        }
        // Tiếp tục xử lý tải lên tệp
        String imageName = UUID.randomUUID().toString();
        Map<String, String> map = new HashMap<>();
        map.put("firebaseStorageDownloadTokens", imageName);
        BlobId blobId = BlobId.of("shopthoitrang-f941e.appspot.com", imageName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                .setMetadata(map)
                .setContentType(file.getContentType())
                .build();
        storage.create(blobInfo, file.getInputStream());
        StringBuilder url = new StringBuilder();
        url.append("https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/");
        url.append(imageName);
        url.append("?alt=media");
        return url.toString();
    }

    public String deleteFile(String url) {
        try {
            String fileName = 
            url.replace("https://firebasestorage.googleapis.com/v0/b/shopthoitrang-f941e.appspot.com/o/", "").replace("?alt=media", "");
            ClassPathResource serviceAccount = new ClassPathResource("firebase-service-account-key.json");
            String projectId = "shopthoitrang-f941e";
            Storage storage = StorageOptions.newBuilder()
                    .setProjectId(projectId)
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount.getInputStream()))
                    .build()
                    .getService();
            String bucketName = "shopthoitrang-f941e.appspot.com";
            Bucket bucket = storage.get(bucketName);
            bucket.get(fileName).delete();
            System.out.println("File deleted successfully." + fileName);
            return "Xoá thành công";
        } catch (Exception e) {
            return "Xoá không thành công";
        }
        
    }
}