package com.gravityworks.derbydata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.app.Activity;
import android.os.Bundle;
import android.util.Log;

public class DerbyDataActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        getLansingDerbyVixens();
    }
    
    public  void getLansingDerbyVixens() {
		String requestURL = "http://derbynames.gravityworksdesign.com/DerbyNamesService.svc/DerbyNames?$filter=League%20eq%20'Lansing%20Derby%20Vixens'";
		//http://derbynames.gravityworksdesign.com/DerbyNamesService.svc/Leagues
		
		Log.i("DerbyData", "getSurvey-Starting");
    	
    	try {
			URL webRequest = new URL(requestURL);
			URLConnection tc = webRequest.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(tc.getInputStream()));
 		
			Log.i("DerbyData", "getSurvey-before loading JSON");
	    	
			StringBuilder surveyJSON = new StringBuilder();
			String currentLine = "";
			
			while ((currentLine = in.readLine()) != null) {
				surveyJSON.append(currentLine);
			}
			
			if (surveyJSON != null) {
				Log.i("DerbyData", "getSurvey-Have Data");
				ArrayList<DerbyName> derbyNames = getDerbyDataFromJSON(surveyJSON.toString());
				
				for(DerbyName item : derbyNames ){
					Log.i("DerbyData", String.format("Name=%s: Number=%s: League=%s", item.getName(), 
							item.getNumber(), item.getLeague()));
				}
			}
		}
    	catch(Exception e) {
			Log.e("DerbyData", "Error getting data" + e.getMessage());
		}
    	
    	Log.i("DerbyData", "getSurvey-finished");
	}
    
    public static ArrayList<DerbyName> getDerbyDataFromJSON(String surveyJSON) {
    	ArrayList<DerbyName> tmpRtn = new ArrayList<DerbyName>();
		
		Log.i("DerbyData", "getDerbyDataFromJSON-Starting");
		
		try {
			JSONObject fullJsonObject = new JSONObject(surveyJSON); 
			JSONArray jsonNames = fullJsonObject.getJSONArray("d");
			
			// loop through each json derby name
			for (int i = 0; i < jsonNames.length(); i++) {
				DerbyName derbyName = new DerbyName();
				
				JSONObject result = jsonNames.getJSONObject(i);
		
				derbyName.setDerbyNameId(result.getInt("DerbyNameId"));
				derbyName.setName(result.getString("Name"));
				derbyName.setNumber(result.getString("Number"));
				derbyName.setLeague(result.getString("League"));
				
				tmpRtn.add(derbyName);
			}
		
		} catch (JSONException e) {
			Log.e("DerbyData", "getDerbyDataFromJSON-Error converting JSON to survey" + e.getMessage());
		} 
		
		Log.i("DerbyData", "getDerbyDataFromJSON-Finished");
		
		// return
		return tmpRtn;
	}

}