package infinite.leaveprojecthib;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class LeaveHistoryDAO {

	SessionFactory sFactory;
	Session session;
	
	public List<LeaveHistory> pendingLeave(int mgrId){
		List<Integer> subOrds=showSubordinate(mgrId);
		sFactory=SessionHelper.getSession();
		
		session=sFactory.openSession();
		Query query2 = session.createQuery("from LeaveHistory where leaveStatus='PENDING'");
		//query2.setParameterList("empId", subOrds);
		//query2.setParameterList("empId", subOrds);
	  	    List<LeaveHistory> pendingLeaves = query2.list();
	  	    return pendingLeaves;
	}
	
	public List<Integer> showSubordinate(int mgrId){
		sFactory=SessionHelper.getSession();
		session=sFactory.openSession();
		Criteria cr=session.createCriteria(Employ.class);
		cr.add(Restrictions.eq("mId",mgrId));
		cr.setProjection(Projections.property("empId"));
		List<Integer> subList=cr.list();
		return subList;
	}
	
	public List<LeaveHistory> searcLeaveHistory(int empId){
		sFactory = SessionHelper.getSession();
  	    session=sFactory.openSession();  
		Query query = session.getNamedQuery("searchLeave");
		query.setParameter("empId",empId);   
		List<LeaveHistory> leaveList = query.list();
		return leaveList;
	}
	
}
