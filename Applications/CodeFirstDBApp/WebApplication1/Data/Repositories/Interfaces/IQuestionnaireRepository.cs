using WebApplication1.Domains.Questionnaire;

namespace WebApplication1.Data.Repositories.Interfaces {
    
    public interface IQuestionnaireRepository {
        
        Questionnaire Add(Questionnaire questionnaire);
        
        bool Remove(int questionnaireId);
    }
}