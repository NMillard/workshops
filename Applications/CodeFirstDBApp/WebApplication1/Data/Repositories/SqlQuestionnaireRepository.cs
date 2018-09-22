using SimpleCodeFirst.Data.Repositories.Interfaces;
using SimpleCodeFirst.Domains.Questionnaire;

namespace SimpleCodeFirst.Data.Repositories {
    
    public class SqlQuestionnaireRepository : IQuestionnaireRepository {
        private readonly AppDbContext _context;

        public SqlQuestionnaireRepository(AppDbContext context) {
            _context = context;
        }
        
        public Questionnaire Add(Questionnaire questionnaire) {
            _context.Questionnaires.Add(questionnaire);

            return questionnaire;
        }

        public bool Remove(int questionnaireId) {
            throw new System.NotImplementedException();
        }
    }
}