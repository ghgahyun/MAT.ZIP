<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>

<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./resources/css/recommend.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
	<title>Welcome to 맛.ZIP</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>

    <div class="mb-4">
        <img src="./resources/images/welcome.jpg" class="img-fluid rounded-3" alt="맛.ZIP 배너" style="width: 100%;">
    </div>

    <%@ include file="dbconn.jsp" %>

    <div class="row align-items-md-stretch text-center mb-4">
      
      <div class="col-md-6 mb-3">
        <div class="h-100">
            <a href="./Foods.jsp">
                <img src="./resources/images/FoodListgo.jpg" class="img-fluid rounded-3" alt="바로가기" style="width: 100%; height: 100%; object-fit: cover; cursor: pointer;">
            </a>
        </div>
      </div>

      <div class="col-md-6 mb-3">
        <div class="recommend-box"> 
            <div class="reco-title" style="text-align: center; font-size: 2.2rem; font-weight: 900; margin-bottom: 20px; color: black;">
                <span style="color: #D9534F;">맛</span><span style="color: #586130;">.ZIP</span><span>의 추천 음식</span>
            </div>
            
            <%
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                String sql = "select * from food order by rand() limit 1";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
            %>
            <div class="row align-items-center mt-3">
                <div class="col-5">
                    <img src="<%=request.getContextPath()%>/resources/images/Food/<%=rs.getString("f_image")%>" class="img-fluid rounded-3" style="width: 100%; height: 130px; object-fit: cover; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
                </div>
                
                <div class="col-7 text-start">
                    <div class="mb-2">
                        <span class="food-title"><%=rs.getString("f_name")%></span>
                        <span class="food-country"><%=rs.getString("f_country")%></span>
                    </div>
                    <p class="text-muted" style="font-size: 0.95rem; margin: 0; line-height: 1.4;">
                        <%=rs.getString("f_shortDesc")%>
                    </p>
                </div>
            </div>
            <%
                }
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            %>
        </div>
      </div>
    </div> 

    <div class="country-section">
        <div class="country-title">
        <span style="color: #D9534F;">맛</span><span style="color: #586130;">.ZIP</span>과 함께하는 나라
    </div>
    
    <div class="row g-3 justify-content-center">
        </div>
	</div>
        
        <div class="row g-3 justify-content-center">
            <div class="col-md-3 col-6"><div class="country-box" onclick="showCountry('korea')">한국</div></div>
            <div class="col-md-3 col-6"><div class="country-box" onclick="showCountry('japan')">일본</div></div>
            <div class="col-md-3 col-6"><div class="country-box" onclick="showCountry('china')">중국</div></div>
            <div class="col-md-3 col-6"><div class="country-box" onclick="showCountry('spain')">스페인</div></div>
            <div class="col-md-3 col-6"><div class="country-box" onclick="showCountry('italy')">이탈리아</div></div>
             <div class="col-md-3 col-6"><div class="country-box" onclick="showCountry('france')">프랑스</div></div>
            <div class="col-md-3 col-6"><div class="country-box" onclick="showCountry('türkiye')">튀르키예</div></div>
        </div>
    </div>

    <div class="modal fade" id="countryModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="border: 3.5px solid #586130; border-radius: 15px;">
          <div class="modal-header" style="border-bottom: 2px solid #eee; display: flex; align-items: center;">
            <div class="d-flex align-items-center">
                <img id="modalFlag" src="" alt="flag" style="width: 40px; margin-right: 10px; border: 1px solid #ddd; border-radius: 4px; box-shadow: 2px 2px 2px rgba(0,0,0,0.1);">
                <h5 class="modal-title" id="modalTitle" style="font-weight: 900; margin: 0;">나라 이름</h5>
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body text-center">
           <img id="modalMap" src="" alt="map" 
     			style="width: 100%; object-fit: cover; border-radius: 10px; border: 2px solid #eee; margin-bottom: 15px;" 
    			onerror="this.src='https://via.placeholder.com/400x200?text=Map+Image';">
            
            <div style="text-align: left; padding: 0 10px;">
                <h6 style="color: #D9534F; font-weight: bold;">특징</h6>
                <p id="modalDesc" style="color:#333; font-size: 1rem; line-height: 1.6;">설명</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
        const countryData = {
        		'korea': { 
        		    title: '한국 (Korea)', 
        		    flag: './resources/images/flags/korea.png', 
        		    map: './resources/images/maps/korea_map.jpg',
        		    desc: '밥과 반찬을 중심으로 김치·된장 같은 발효 음식과 매콤한 양념이 어우러진 정(情)의 식문화.' 
        		},
        		'japan': { 
        		    title: '일본 (Japan)', 
        		    flag: './resources/images/flags/japan.png', 
        		    map: './resources/images/maps/japan_map.jpg',
        		    desc: '재료 본연의 맛을 살리는 섬세한 조리법과 스시·라멘·덴푸라로 대표되는 균형 잡힌 식문화.' 
        		},
        		'china': { 
        		    title: '중국 (China)', 
        		    flag: './resources/images/flags/china.png', 
        		    map: './resources/images/maps/china_map.jpg',
        		    desc: '불맛이 살아있는 볶음 요리와 딤섬, 지역마다 다른 다양한 식재료와 조리법이 특징.' 
        		},
        		'spain': { 
        		    title: '스페인 (Spain)', 
        		    flag: './resources/images/flags/spain.png', 
        		    map: './resources/images/maps/spain_map.jpg',
        		    desc: '해산물과 올리브 오일을 활용한 빠에야와 소량의 음식을 즐기는 타파스 문화.' 
        		},
        		'italy': { 
        		    title: '이탈리아 (Italy)', 
        		    flag: './resources/images/flags/italy.png', 
        		    map: './resources/images/maps/italy_map.jpg',
        		    desc: '피자와 파스타로 유명하며, 올리브 오일·토마토·치즈의 단순하지만 깊은 맛의 조화.' 
        		},
        		'france': { 
        		    title: '프랑스 (France)', 
        		    flag: './resources/images/flags/france.png', 
        		    map: './resources/images/maps/france_map.jpg',
        		    desc: '요리를 예술처럼 여기는 나라로, 소스 중심의 정교한 조리와 풍부한 미식 문화가 특징.' 
        		},
        		'türkiye': { 
        		    title: '튀르키예 (Türkiye)', 
        		    flag: './resources/images/flags/turkey.png', 
        		    map: './resources/images/maps/turkey_map.jpg',
        		    desc: '동서양 문화가 어우러진 케밥 중심의 요리와 향신료·유제품을 활용한 풍부한 맛.' 
        		}

        };

        function showCountry(countryCode) {
            const data = countryData[countryCode];
            if (!data) return; // 데이터 없으면 중단

            // 1. 텍스트 채우기
            document.getElementById('modalTitle').innerText = data.title;
            document.getElementById('modalDesc').innerText = data.desc;
            
            // 2. 이미지 경로 채우기
            const flagImg = document.getElementById('modalFlag');
            const mapImg = document.getElementById('modalMap');

            // 데이터에 경로가 있으면 넣고, 없으면 빈 값 (혹은 기본값)
            flagImg.src = data.flag ? data.flag : "";
            mapImg.src = data.map ? data.map : "";

            // 3. 모달 띄우기
            var myModal = new bootstrap.Modal(document.getElementById('countryModal'));
            myModal.show();
        }
    </script>

    <div class="text-center">
        <h3 class="mt-4">Welcome to MAT.ZIP!!</h3>
        <%
            Date day = new java.util.Date();
            String am_pm;
            int hour = day.getHours();
            int minute = day.getMinutes();
            int second = day.getSeconds();
            if (hour / 12 == 0) {
                am_pm = "AM";
            } else {
                am_pm = "PM";
                hour = hour - 12;
            }
            String CT = hour + ":" + minute + ":" + second + " " + am_pm;
            out.println("<p>현재 접속 시각: " + CT + "</p>");
        %>
    </div>
	
	<%@ include file="footer.jsp"%>
   
  </div>
</body>
</html>