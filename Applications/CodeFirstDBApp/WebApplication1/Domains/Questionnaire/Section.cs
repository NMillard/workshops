namespace WebApplication1.Domains.Questionnaire {
    
    public class Section {
        
        public int Id { get; set; }
        
        public string Name { get; set; }
        
        public double Weighting { get; set; }
        
        public Questionnaire Questionnaire { get; set; }

        public Section() {
            
        }
    }
}