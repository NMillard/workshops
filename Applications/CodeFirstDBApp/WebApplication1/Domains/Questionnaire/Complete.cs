using System;
using System.Collections.Generic;

namespace SimpleCodeFirst.Domains.Questionnaire {
    
    public class Complete {
        
        public int Id { get; set; }

        public Respondent Respondent { get; set; }

        public Questionnaire Questionnaire { get; set; }

        public ICollection<Reply> Replies { get; set; }

        public DateTime RegisteredOn { get; set; }

        public Complete() {
            RegisteredOn = DateTime.Now;
        }
    }
}