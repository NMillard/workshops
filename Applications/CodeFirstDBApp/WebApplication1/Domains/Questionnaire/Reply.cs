namespace SimpleCodeFirst.Domains.Questionnaire {
    
    public class Reply {

        public int Id { get; set; }
        
        public string OtherValue { get; set; }
        
        public Option Option { get; set; }
        
        public Complete Complete { get; set; }
    }
}