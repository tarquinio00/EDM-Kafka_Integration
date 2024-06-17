package dev.tartar.connect.traceability;

public class TraceabilityJsonItem {
    private Product Product;
    private String CustomerCode;
    private CheckListEntryItem CheckListEntryItem;
    private String CreatedUtcDate;

    TraceabilityJsonItem() {
        this.Product = new Product();
        this.CheckListEntryItem = new CheckListEntryItem();
    }

    public void setProduct(String color, String number){
        Product.setColorText(color);
        Product.setProductNumber(number);
    }
    public void setCustomerCode(String CustomerCode){
        this.CustomerCode = CustomerCode;
    }
    public void setCheckResult(boolean op_result){
        CheckListEntryItem.setOpResult(op_result);
    }
    public void setDate(String CreatedUtcDate){
        this.CreatedUtcDate = CreatedUtcDate;
    }
    public void setCheckList(CheckListEntryItem checkListEntryItem) {
        this.CheckListEntryItem = checkListEntryItem;
    }





    public Product getProduct(){
        return Product;
    }
    public String getCustomerCode(){
        return CustomerCode;
    }
    public CheckListEntryItem getCheckList(){
        return CheckListEntryItem;
    }
    public String getDate(){
        return this.CreatedUtcDate;
    }

    @Override
    public String toString() {
        StringBuilder string = new StringBuilder();
        if(Product != null)
            string.append("Product: "+ Product.getColorText() + ", " + Product.getProductNumber() + " - ");
        else string.append("Product: null - ");
        if(!getCustomerCode().isEmpty())
            string.append("CustomerCode: "+ getCustomerCode() + " - ");
        else string.append("CustomerCode: null - ");
        if(CheckListEntryItem!=null)
            string.append("CheckListEntryItem: "+ CheckListEntryItem.getResult_B() + " - ");
        else string.append("CheckListEntryItem: null - ");
        if(!getDate().isEmpty())
            string.append("CreatedUtcDate: "+ getDate());
        else string.append("Date: empty");

        return string.toString();
    }      

}
