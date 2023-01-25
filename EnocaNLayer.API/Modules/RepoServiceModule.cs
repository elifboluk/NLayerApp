using Autofac;
using EnocaNLayer.Core.Repositories;
using EnocaNLayer.Core.Services;
using EnocaNLayer.Core.UnitOfWorks;
using EnocaNLayer.Repository;
using EnocaNLayer.Repository.Repositories;
using EnocaNLayer.Repository.UnitOfWorks;
using EnocaNLayer.Service.Mapping;
using EnocaNLayer.Service.Services;
using System.Reflection;
using Module = Autofac.Module;

namespace EnocaNLayer.API.Modules
{
    public class RepoServiceModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterGeneric(typeof(GenericRepository<>)).As(typeof(IGenericRepository<>)).InstancePerLifetimeScope();
            builder.RegisterGeneric(typeof(Service<>)).As(typeof(IService<>)).InstancePerLifetimeScope();
            builder.RegisterType<UnitOfWork>().As<IUnitOfWork>().InstancePerLifetimeScope();
            
            var apiAssembly = Assembly.GetExecutingAssembly();
            var repoAssembly = Assembly.GetAssembly(typeof(AppDbContext));
            var serviceAssembly = Assembly.GetAssembly(typeof(MapProfile));
            
            builder.RegisterAssemblyTypes(apiAssembly, repoAssembly, serviceAssembly).Where(x => x.Name.EndsWith("Repository")).AsImplementedInterfaces().InstancePerLifetimeScope();

            builder.RegisterAssemblyTypes(apiAssembly, repoAssembly, serviceAssembly).Where(x => x.Name.EndsWith("Service")).AsImplementedInterfaces().InstancePerLifetimeScope();            
        }
    }
}
