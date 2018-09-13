package com.github.yard01.liferay7.orm.bookdb;

import java.util.List;

import org.hibernate.Session;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;

/**
 * @author yard
 */
public class OrmBookdbActivator implements BundleActivator {

	public void demoHibernate() {
		DBCommandProcessor dbcp = new DBCommandProcessor("bob", "123");
		List<SAT_Book> list =  dbcp.getBooks();
		for (SAT_Book book : list) {
			System.out.println(book.author + ", " + book.name+ " (" + book.genre + ") ");
		}		
		dbcp.closeCurrentSession();		
	}
	
	@Override
	public void start(BundleContext bundleContext) throws Exception {
		demoHibernate();
	}

	@Override
	public void stop(BundleContext bundleContext) throws Exception {
	}

}