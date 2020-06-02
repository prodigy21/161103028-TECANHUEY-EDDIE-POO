
public class Excepciones {
    public static void main(String[] args) {
         int numerador;
         //int denominador;
         Integer denominador=null;
         float divicion=0;
         
         numerador = 20;
        
         System.out.println("Antes de la divición");
         //divicion=numerador/denominador;
         
         try{
         divicion=numerador/denominador;}
         
         catch(Exception s){
             System.out.println(s.getMessage());
         }
         System.out.println(divicion);
         System.out.println("Después de la divicion");
    }
}
