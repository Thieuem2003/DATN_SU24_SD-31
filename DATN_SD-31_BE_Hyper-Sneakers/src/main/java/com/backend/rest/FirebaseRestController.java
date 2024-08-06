package com.backend.rest;

import com.backend.service.FirebaseFileService;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
@CrossOrigin("*")
@RestController
@RequestMapping("/api/upload")
public class FirebaseRestController {
    @Autowired
    private FirebaseFileService firebaseFileService;


    @PostMapping(value = "", consumes = "multipart/form-data")
    public ResponseEntity<Object> uploadFile(@RequestParam("files") MultipartFile[] files) {
        List<String> listURL = new ArrayList<>();
        for (MultipartFile file : files) {
            String urlImage = "";
            try {
                urlImage = firebaseFileService.saveTest(file);
                listURL.add(urlImage);
            } catch (Exception e) {
                //  throw internal error;
                e.printStackTrace();
            }
        }
        return new ResponseEntity<>(listURL, HttpStatus.OK);
    }

    @GetMapping(value = "detete")
    public ResponseEntity<Object> getMethodName(@RequestParam String url) throws IOException {
        return ResponseEntity.ok(firebaseFileService.deleteFile(url));
    }

    @GetMapping(value = "getFile")
    public ResponseEntity<byte[]> getFile(@RequestParam String url) throws IOException {
        try {
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpGet httpGet = new HttpGet(url);
            HttpResponse response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();

            String contentType = entity.getContentType().getValue();
            InputStream inputStream = entity.getContent();

            // Đọc dữ liệu từ InputStream và ghi vào ByteArrayOutputStream
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] fileData = outputStream.toByteArray();
            // Xác định MediaType dựa trên ContentType
            MediaType mediaType = MediaType.parseMediaType(contentType);
            return ResponseEntity.ok()
                    .contentType(mediaType)
                    .body(fileData);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
