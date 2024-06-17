package dev.tartar.connect.traceability;

public class Product {
    private String ColorText;
    private String ProductNumberIn;

    Product(){};

    public void setColorText(String color){
        this.ColorText = color;
    }
    public void setProductNumber(String ProductNumberIn){
        this.ProductNumberIn = ProductNumberIn;
    }

    public String getColorText(){
        return this.ColorText;
    }
    public String getProductNumber(){
        return this.ProductNumberIn;
    }
}
