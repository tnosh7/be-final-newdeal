package com.newdeal.staynest.dto;

import java.util.List;

public class GeocodingResponse {
    private List<Document> documents;

    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }

    public static class Document {
        private String address_name;
        private double x;
        private double y;

        public String getAddress_name() {
            return address_name;
        }

        public void setAddress_name(String address_name) {
            this.address_name = address_name;
        }

        public Double getX() {
            return x;
        }

        public void setX(double x) {
            this.x = x;
        }

        public Double getY() {
            return y;
        }

        public void setY(double y) {
            this.y = y;
        }
    }
}
