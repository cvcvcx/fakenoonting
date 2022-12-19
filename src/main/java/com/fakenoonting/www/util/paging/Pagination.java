package com.fakenoonting.www.util.paging;

import lombok.Data;

@Data
public class Pagination {

    private int listSize = 5;      // 한 페이지당 보여줄 데이터 개수
    private int rangeSize = 10;     // 한 페이지 범위에서 보여줄 페이지 개수
    private int page;   // 현재 선택한 페이지 번호
    private int range;  // 현재 페이지가 위치해있는 페이지 범위의 값
                        // 1~10번페이지(현재페이지) -> 1(범위),  11~20페이지 -> 2,   21~30 페이지 -> 3 ...
    private int listCnt;    // 데이터 총 개수
    private int pageCnt;    // 페이지 총 개수
    private int startList;  // 현재 페이지 기준 앞에 있는 데이터들 개수
    private int startPage;  // 각 페이지 범위에서 시작 번호
    private int endPage;    // 각 페이지 범위에서 끝 번호
    private boolean prev;   // 이전 페이지 여부
    private boolean next;   // 다음 페이지 여부

    public void pageInfo(int page, int range, int listCnt) {    // 현재페이지, 현재페이지가위치한범위값, 데이터총개수
        this.page = page;
        this.range = range;
        this.listCnt = listCnt;

        // 전체 페이지수
        this.pageCnt = (int)Math.ceil((double)listCnt/listSize);

        // 시작 페이지
        this.startPage = (range - 1) * rangeSize + 1 ;

        // 끝 페이지
        this.endPage = range * rangeSize;

        // 게시판 시작 번호(=현재 페이지 기준 앞에 있는 데이터들 개수, 0부터 시작)
        this.startList = (page - 1) * listSize;

        // 이전 버튼 상태
        this.prev = range == 1 ? false : true;

        // 다음 버튼 상태
        // 마지막 페이지는 데이터가 없어도 무조건 10개씩 계산됨
        // 그래서 총 페이지 개수가 이보다 작을경우 총 페이지 개수로 마지막 페이지를 바꿔줌
        this.next = endPage > pageCnt ? false : true;
        if (this.endPage > this.pageCnt) {
            this.endPage = this.pageCnt;
            this.next = false;
        }
    }
}
