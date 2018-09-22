using System.Collections.Generic;

namespace SimpleCodeFirst.Domains.Questionnaire {
    
    public class Question {
        
        public int Id { get; set; }
        
        public string Text { get; set; }
        
        public string Description { get; set; }
        
        public bool IsRequired { get; set; }
        
        public bool IsIgnorable { get; set; }
        
        public bool AllowMultipleAnswers { get; set; }

        public bool IsCommentable { get; set; }
        
        public ICollection<Option> Options { get; set; }

        public Question() {
            Options = new List<Option>();
        }
    }
}