using Microsoft.EntityFrameworkCore;
using SimpleCodeFirst.Domains.Questionnaire;

namespace SimpleCodeFirst.Data {
    
    public class AppDbContext : DbContext {

        public DbSet<Complete> Completes { get; set; }
        public DbSet<Reply> Replies { get; set; }
        public DbSet<Questionnaire> Questionnaires { get; set; }
        public DbSet<Section> Sections { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<QuestionType> QuestionTypes { get; set; }
        public DbSet<Option> Options { get; set; }
        public DbSet<Respondent> Respondent { get; set; }
        
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) {
        }
    }
}