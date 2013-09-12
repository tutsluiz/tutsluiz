package emporio.supermercado.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class HibernateUtil {
	private static SessionFactory sessionFactory;
	
	private HibernateUtil() {
		
	}
	
	public static Session getSession() {
		return getSessionFactory().openSession();
	}
	
	private static SessionFactory getSessionFactory() {
		Configuration configuration = new Configuration();
	    configuration.configure();
	    ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
	    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		
		return sessionFactory;
	}
	
	/**
	 * Utilizado para criar as tabelas no banco
	 * @param args
	 */
	public static void main(String[] args) {
		Configuration cfg = new Configuration();
		cfg.configure();
		new SchemaExport(cfg).create(true, true); 
	}
}
