/**
 * 
 */
function changepage() {
	var txtValue2 = document.getElementById("Text1").value;
    if (txtValue != txtValue2) {
	    if (txtValue2 > pageCount()) {
	 
	    }
	    else if (txtValue2 <= 0) {
	 
	    }
	    else if (txtValue2 == 1) {
	        first();
	    }
	    else if (txtValue2 == pageCount()) {
	        last();
	    }
	    else {
	        hideTable();
	        page = txtValue2;
	        pageNum2.value = page;
	 
	        currentRow = pageSize * page;
	        maxRow = currentRow - pageSize;
	        if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
	        for (var i = maxRow; i < currentRow; i++) {
	        	theTable.rows[i].style.display = '';
	        }
		    if (maxRow == 0) { preText(); firstText(); }
		    showPage();
		    nextLink();
		    lastLink();
		    preLink();
		    firstLink();
	    }
	 
	    txtValue = txtValue2;
    }
}
            


  //��ȡ��Ӧ�ؼ�
    var totalPage = document.getElementById("spanTotalPage");//��ҳ��
    var pageNum = document.getElementById("spanPageNum");//��ǰҳ
    var totalInfor = document.getElementById("spanTotalInfor");//��¼����
    var pageNum2 = document.getElementById("Text1");//��ǰҳ�ı���
     
    var spanPre = document.getElementById("spanPre");//��һҳ
    var spanNext = document.getElementById("spanNext");//��һҳ
    var spanFirst = document.getElementById("spanFirst");//��ҳ
    var spanLast = document.getElementById("spanLast");//βҳ
    var pageSize = 10;//ÿҳ��Ϣ����
     
 
     
    var page = 1;
     
    //��һҳ
    function next() {
        if (pageCount() <= 1) {
        }
        else {
                hideTable();
                currentRow = pageSize * page + 1; //��һҳ�ĵ�һ��
                maxRow = currentRow + pageSize;    //��һҳ��һ��
                if (maxRow > numberRowsInTable) maxRow = numberRowsInTable+1;//�����������һҳ���һ�д���ʵ�����һ���к�
                for (var i = currentRow; i < maxRow; i++) {
                    theTable.rows[i].style.display = '';
                }
                page++;
                pageNum2.value = page;
                if (maxRow == numberRowsInTable) { //�����һҳ�����һ���Ǳ������һ��
                    nextNoLink(); //��һҳ ��βҳ �����
                    lastNoLink(); 
                }
                showPage();//����page��ʾ
                if (page == pageCount()) {//�����ǰҳ��βҳ
                    nextNoLink();
                    lastNoLink();
                }
                
                preLink();
                firstLink();
            }
        }
     
     
     
    //��һҳ
    function pre() {
        if (pageCount() <= 1) {
        }
        else {       
                hideTable();
                page--;
                pageNum2.value = page;
                currentRow = pageSize * page + 1;//��һҳ�ĵ�һ��
                maxRow = currentRow - pageSize;//��ҳ�ĵ�һ��
                if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;//��������б�ҳ�ĵ�һ��С��ʵ����ҳ�ĵ�һ���кţ������
                for (var i = maxRow; i < currentRow; i++) {
                    theTable.rows[i].style.display = '';
                }
                if (maxRow == 0) { preNoLink(); firstNoLink(); }
                showPage();//����page��ʾ
                if (page == 1) {
                    firstNoLink();
                    preNoLink();
                }
                nextLink();
                lastLink();
            }
        }
     
     
    //��һҳ
    function first() {
        
        if (pageCount() <= 1) {
        }
        else {
            hideTable();//����������
            page = 1;
            pageNum2.value = page;
            for (var i = 1; i < pageSize+1; i++) {//��ʾ��һҳ����Ϣ
                theTable.rows[i].style.display = '';
            }
            showPage();//���õ�ǰҳ
     
            firstNoLink();
            preNoLink();
            nextLink();
            lastLink();
        }
    }
     
     
    //���һҳ
    function last() {
        if (pageCount() <= 1) {
        }
        else {
            hideTable();//����������
            page = pageCount();//����ǰҳ����Ϊ���ҳ��
            pageNum2.value = page;
            currentRow = pageSize * (page - 1)+1;//��ȡ���һҳ�ĵ�һ���к�
            for (var i = currentRow; i < numberRowsInTable+1; i++) {//��ʾ��������һҳ��Ϣ
                theTable.rows[i].style.display = '';
            }
     
            showPage();
            lastNoLink();
            nextNoLink();
            preLink();
            firstLink();
        }
    }
     
     
    function hideTable() {//���ر������
        for (var i = 0; i < numberRowsInTable+1; i++) {
            theTable.rows[i].style.display = 'none';
        }
        theTable.rows[0].style.display = '';//��������ʾ
    }
     
     
    function showPage() {//���õ�ǰҳ��
        pageNum.innerHTML = page;
    }
     
    function inforCount() {//�����ܼ�¼��
        spanTotalInfor.innerHTML = colunm;
    }
     
    //�ܹ�ҳ��
    function pageCount() {
        var count = 0;
        if (numberRowsInTable % pageSize != 0) count = 1;
        return parseInt(numberRowsInTable / pageSize) + count;
    }
     
     
    //��ʾ���� link��������Ӧ�����ֱ�ɿɵ����ҳ��  nolink��������Ӧ�����ֱ�ɲ��ɵ����
    function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>��һҳ</a>"; }
    function preNoLink(){ spanPre.innerHTML = "��һҳ"; }
     
    function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>��һҳ</a>"; }
    function nextNoLink(){ spanNext.innerHTML = "��һҳ";}
     
    function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>��ҳ</a>"; }
    function firstNoLink(){ spanFirst.innerHTML = "��ҳ";}
     
    function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>βҳ</a>"; }
    function lastNoLink(){ spanLast.innerHTML = "βҳ";}
     
    //��ʼ�����
    function hide() {
        for (var i = pageSize + 1; i < numberRowsInTable+1 ; i++) {
            theTable.rows[i].style.display = 'none';
        }
        theTable.rows[0].style.display = '';
     
        inforCount();
     
        totalPage.innerHTML = pageCount();
        showPage();
        pageNum2.value = page;
     
        if (pageCount() > 1) {
            nextLink();
            lastLink();
        }
     
    }
     
    hide();