using SimpleCodeFirst.Domains.Questionnaire;

namespace SimpleCodeFirst.Data.Repositories.Interfaces {
    
    public interface IQuestionnaireRepository {
        
        Questionnaire Add(Questionnaire questionnaire);
        
        bool Remove(int questionnaireId);
    }
}