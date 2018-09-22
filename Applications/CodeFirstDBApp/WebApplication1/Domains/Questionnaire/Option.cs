namespace SimpleCodeFirst.Domains.Questionnaire {
    
    public class Option {
        
        public int Id { get; set; }
        
        public string Text { get; set; }
        
        public int Value { get; set; }
        
        public bool HasOtherValue { get; set; }

        public Question Question { get; set; }

        public Option() {
            
        }
    }
}