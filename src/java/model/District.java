package model;
public class District {
    private int districtID;
    private int consciousID;
    private String name;

    public District(int districtID, int consciousID, String name) {
        this.districtID = districtID;
        this.consciousID = consciousID;
        this.name = name;
    }

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public int getConsciousID() {
        return consciousID;
    }

    public void setConsciousID(int consciousID) {
        this.consciousID = consciousID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

  
}
