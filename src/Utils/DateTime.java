package Utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {
    public static String gainTime() {
        Date date=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = sdf.format(date);
        return dateString;
    }
}
