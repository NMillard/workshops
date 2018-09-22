using System.Collections.Generic;

namespace SimpleCodeFirst.Domains.Questionnaire {
    
    public class Questionnaire {
        
        public int Id { get; set; }
        
        public string Name { get; set; }
        
        public string Description { get; set; }
        
        public ICollection<Section> Sections { get; set; }
        
        public Questionnaire() {
            Sections = new List<Section>();
        }
    }
}