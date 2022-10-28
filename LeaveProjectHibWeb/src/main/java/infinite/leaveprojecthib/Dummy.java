package infinite.leaveprojecthib;

public class Dummy {

	public static void main(String[] args) {
		LeaveHistoryDAO dao = new LeaveHistoryDAO();
		System.out.println("Total Records");
		System.out.println(dao.showSubordinate(1000));
	}
}
