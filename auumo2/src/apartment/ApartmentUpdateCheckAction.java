package apartment;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import bean.ApertmentMstBean;
import tool.Action;

public class ApartmentUpdateCheckAction extends Action {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		StringBuffer  error_message= new StringBuffer();

		ApertmentMstBean apbean=new ApertmentMstBean();
		//間取りイメージ
		Part part=request.getPart("floor_plan_image");
		byte[] bytes=null;

		if(part!=null) {
			InputStream inputStream = part.getInputStream();
			bytes= convertInputStreamToByteArray(inputStream);
			//apbean.setFloor_plan_image(bytes);
			//session.setAttribute("ApertmentMstBean",apbean);
		}

		//物件画像
		Part part2=request.getPart("apartment_image");
		byte[] bytes2=null;
		if(part2!=null) {
			InputStream inputStream2 = part2.getInputStream();
			bytes2 = convertInputStreamToByteArray(inputStream2);
			//apbean.setFloor_plan_image(bytes);
			//session.setAttribute("ApertmentMstBean",apbean);
		}

		//元の画像をBase64からデコード
		byte[] floor_plan_image_before=Base64.getDecoder().decode(request.getParameter("floor_plan_imageBase64_before"));
		byte[] apartment_image_before=Base64.getDecoder().decode(request.getParameter("apartment_imageBase64_before"));

		//画像以外の値を取得
		int apartment_cord=Integer.parseInt(request.getParameter("apartment_cord"));
		String apartment_name = request.getParameter("apartment_name"); //物件名
		String apartment_address1 = request.getParameter("apartment_address1"); //物件住所（都道府県）
		String apartment_address2 = request.getParameter("apartment_address2"); //物件住所（市区町村）
		String contact_telnumber = request.getParameter("contact_telnumber"); //管理先電話番号
		String apartment_explanation = request.getParameter("apartment_explanation"); //物件説明
		String floor_plan = request.getParameter("floor_plan");//間取り
		String de_reward =request.getParameter("depsit_reward");//敷金・礼金
		String rnt = request.getParameter("rent");//家賃
		String pet_friendly = request.getParameter("pet_friendly"); //ペット可否

		apbean.setApartment_cord(apartment_cord);				//0 物件コード
		apbean.setApartment_name(apartment_name);				//1 物件名
		apbean.setApartment_address1(apartment_address1);		//2 物件住所1
		apbean.setApartment_address2(apartment_address2);		//3 物件住所2
		apbean.setContact_telnumber(contact_telnumber);			//4 管理先電話番号
		apbean.setApartment_explanation(apartment_explanation);	//5 物件説明
		apbean.setFloor_plan(floor_plan);						//6 間取り

		if(bytes.length==0) {
			apbean.setFloor_plan_image(floor_plan_image_before);						//7 間取りの画像
			apbean.setFloor_plan_imageBase64(Base64.getEncoder().encodeToString(floor_plan_image_before));
		}else {
			apbean.setFloor_plan_image(bytes);
			apbean.setFloor_plan_imageBase64(Base64.getEncoder().encodeToString(bytes));
		}
		apbean.setPet_friendly(pet_friendly);									//10 ペット可否

		if(bytes2.length==0) {
			apbean.setApartment_image(apartment_image_before);						//11 物件画像
			apbean.setApartment_imageBase64(Base64.getEncoder().encodeToString(apartment_image_before));
		}else {
			apbean.setApartment_image(bytes2);
			apbean.setApartment_imageBase64(Base64.getEncoder().encodeToString(bytes2));
		}

		error_message.append(nameNullCheck(apartment_name));
		error_message.append(add1NullCheck(apartment_address1));
		error_message.append(add2NullCheck(apartment_address2));
		error_message.append(tellNullCheck(contact_telnumber));
		error_message.append(pet_friendlyNullCheck(pet_friendly));
		error_message.append(imageSizeCheck(part,"間取り"));
		error_message.append(imageSizeCheck(part2,"物件画像"));

//空文字のStringをintに変換するとエラーが出るため、String型で入力チェックして変換
		if (de_reward.length()<=0) {
			 error_message.append(" 敷金・礼金 は入力必須項目です。<br> ");
		}else {
			int depsit_reward =Integer.parseInt(de_reward);
			apbean.setDepsit_reward(depsit_reward); //8 敷金・礼金
		}

		if (rnt.length()<=0) {
			 error_message.append(" 家賃 は入力必須項目です。<br>");
		}else {
			int rent=Integer.parseInt(rnt);
			apbean.setRent(rent); //9 家賃
		}

		if ( error_message.length() > 0) {
			//チェックエラーあり
			request.setAttribute("apbean", apbean);
			session.setAttribute("ap_update_error_message", error_message);
			return "ap_update.jsp";
		} else {
			//チェックエラーなしならbeanに家賃、敷金礼金をセット
			session.setAttribute("apupdate", apbean);
			return "ap_updatecheck.jsp";
		}
	}

    //InputStreamをByte配列にする
    public byte[] convertInputStreamToByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[16777215];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        return buffer.toByteArray();
    }


	private StringBuffer nameNullCheck(String name) {
		StringBuffer  error_message = new StringBuffer();
		if (name.length()<=0) {//""ならば
			 error_message.append(" 物件名 は入力必須項目です。<br>");
		}

	   //物件名は1文字以上、500バイト文字以内
	   if(name.length()>=1 &name.length()<=50) {
		   //チェックエラーなし
	   } else {
		   error_message.append("物件名は全角で1文字以上、50文字以内で指定してください。</br>");
	   }
		return  error_message;
	}
	private StringBuffer add1NullCheck(String address1) {
		StringBuffer  error_message = new StringBuffer();
		if (address1.length()<=0) {//""ならば
			 error_message.append(" 住所（都道府県） は入力必須項目です。<br>");
		}
		return  error_message;
	}
	private StringBuffer add2NullCheck(String address2) {
		StringBuffer  error_message = new StringBuffer();
		if (address2.length()<=0) {//""nullならば
			 error_message.append(" 住所（市区町村） は入力必須項目です。<br>");
		}

	   //住所２は1文字以上、500バイト文字以内
	   if(address2.length()>=1 &address2.length()<=50) {
		   //チェックエラーなし
	   } else {
		   error_message.append("市区町村は全角で1文字以上、50文字以内で指定してください。</br>");
	   }
		return  error_message;
	}
	private StringBuffer tellNullCheck(String tel) {
		StringBuffer  error_message = new StringBuffer();
		if (tel.length()<=0) {//""ならば
			 error_message.append(" 管理先電話番号 は入力必須項目です。<br>");
		}
		return  error_message;
	}

	private StringBuffer pet_friendlyNullCheck(String pet_friendly) {
		StringBuffer  error_message = new StringBuffer();
		if (pet_friendly.length()<=0) {//""ならば
			 error_message.append(" ペット可否 は入力必須項目です。<br>");
		}
		return  error_message;
	}

	private StringBuffer imageSizeCheck(Part image,String kind) {
		StringBuffer  error_message = new StringBuffer();
		if( image.getSize()==16000000) {//バイト数が16メガ以上ならば
			 error_message.append(" "+kind+"の画像サイズが大きすぎます。<br>");
		}
		return  error_message;
	}
}


