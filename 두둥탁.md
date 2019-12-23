order by & min max 를 하면 전체 DB를 다 뒤진다.

Index를 사용하면 삽입, 검색, 정렬이 빨라짐

Index를 많이 쓰면 쿼리 플랜이 이상해질 수도 있다.

Index를 만들 때는 cardinality(중복 최소화) & selectivity(검색 결과가 전체의 20% 이내 정도)를 고려해야 한다 

쿼리 조건에 따라 Index를 사용하지 못할 수 있다.

