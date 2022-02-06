package DAO;

import Model.Promo;
import java.util.List;

public interface PromoDAO {
    public List<Promo> getAllPromo();
    public List<Promo> getPromo (String PromoName);
    public void insertPromo(Promo p);
    public void deletePromo(int id);
    public void updatePromo(int id, Promo p);   
}