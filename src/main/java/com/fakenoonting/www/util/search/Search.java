package com.fakenoonting.www.util.search;

import com.fakenoonting.www.util.paging.Pagination;
import lombok.Data;

@Data
public class Search extends Pagination {

//    private String searchType;
    private String keyword;
}
