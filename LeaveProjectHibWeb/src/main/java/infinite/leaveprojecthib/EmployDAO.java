package infinite.leaveprojecthib;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;




public class EmployDAO {

	SessionFactory sFactory;
	Session session;
	
	
	public Employ searchEmploy(int empId) {
		sFactory = SessionHelper.getSession();
  	    Session session=sFactory.openSession();  
		Query query = session.getNamedQuery("searchEmploy");
		query.setParameter("empId",empId);   
		List<Employ> employList = query.list();
		if (employList.size()==0) {
			return null;
		} 
		return employList.get(0);
	}
	public List<Employ> showEmploy() {
		sFactory= SessionHelper.getSession();
  	    Session session=sFactory.openSession();  
		Query query = session.getNamedQuery("showEmploy");
		List<Employ> employList = query.list();
		return employList;
	}
}
