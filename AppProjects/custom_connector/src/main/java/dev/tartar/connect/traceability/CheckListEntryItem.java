package dev.tartar.connect.traceability;


public class CheckListEntryItem {
    private boolean OpResult;
    private transient String resultString; //transient specify to ignore this field to Gson

    public CheckListEntryItem(){};

    public void setOpResult(boolean result){
        this.OpResult = result;     
    }
    
    public void setResult_S(String result){
        this.resultString = result;
    }
    
    public boolean getResult_B(){
        return this.OpResult;
    }
    
    public String getResult_S(){
        return resultString;
    }
    
}
