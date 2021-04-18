using System.Linq;
using System.Threading.Tasks;
using Core.Entities.Identity;
using Microsoft.AspNetCore.Identity;

namespace Infrastructure.Identity
{
    public class AppIdentityDbContextSeed
    {
        public static async Task SeedUsersAsync(UserManager<AppUser> userManager)
        {
            if (!userManager.Users.Any())
            {
                var user = new AppUser
                {
                    DisplayName = "Smruti",
                    Email = "smruti@test.com",
                    UserName = "smruti@test.com",
                    Address = new Address
                    {
                        FirstName = "Smruti",
                        LastName = "Ranjan",
                        Street = "St. Mother Teresa Road",
                        City = "Bhubaneswar",
                        State = "Odisha",
                        ZipCode = "751007"
                    }
                };

                await userManager.CreateAsync(user, "Pa$$w0rd");
            }
        }
    }
} 