package com.sild.tviewer;

import org.springframework.beans.support.PagedListHolder;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author Dmitry Korchagin.
 */
public class Util {
    final static int PAGE_SIZE = 10;

    public static <E> void addPaginator(ModelAndView modelAndView, List<E> list, String modelName, Integer page) {
        PagedListHolder<E> pagedListHolder = new PagedListHolder<>(list);
        pagedListHolder.setPageSize(PAGE_SIZE);
        modelAndView.addObject("maxPage", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
        }
        pagedListHolder.setPage(page - 1);
        modelAndView.addObject(modelName, pagedListHolder.getPageList());
        modelAndView.addObject("page", page);
    }
}
