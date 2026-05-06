$(document).ready(function(){
    /* freeUseDesc 번호 넣기 */

    var freeUseDesc = $('#koglOpen').text();

    /* freeUseDesc 번호별 공공누리 마크 */
    if(freeUseDesc == '1' ){
        $('#koglOpen').text('');
        $('#koglOpen').in('<div className="codeView01 hide"' +
            '         style="position:relative;margin:0;padding:0;margin-top:30px;background:#fff;border:1px solid #dbdbdb;padding:35px 15px 35px 350px;font-size:16px;color:#292929;font-weight:bold;">' +
            '        <img src="/resource/kor/images/koglOpen/img_opentype1.jpg" alt="공공누리 1유형"' +
            '             style="position:absolute;left:20px;top:10%;vertical-align:middle;width:210px;"/> 본 공공저작물은 공공누리' +
            '        "출처표시" 조건에 따라 이용할 수 있습니다.</div>');
        $('#koglOpen').css('display', 'inline');

    } else if (freeUseDesc == '2'){
        $('#koglOpen').text('');
        $('#koglOpen').html('<div className="codeView02 hide"' +
            '         style="position:relative;margin:0;padding:0;margin-top:30px;background:#fff;border:1px solid #dbdbdb;padding:35px 15px 35px 350px;font-size:16px;color:#292929;font-weight:bold;">' +
            '        <img src="/resource/kor/images/koglOpen/img_opentype2.jpg" alt="공공누리 2유형"' +
            '             style="position:absolute;left:20px;top:10%;vertical-align:middle;width:255px;"/> 본 공공저작물은 공공누리' +
            '        “출처표시+상업적이용금지” 조건에 따라 이용할 수 있습니다.</div>');
        $('#koglOpen').css('display', 'inline');

    } else if (freeUseDesc == '3'){
        $('#koglOpen').text('');
        $('#koglOpen').html('<div className="codeView03 hide"' +
           '         style="position:relative;margin:0;padding:0;margin-top:30px;background:#fff;border:1px solid #dbdbdb;padding:35px 15px 35px 350px;font-size:16px;color:#292929;font-weight:bold;">' +
           '        <img src="/resource/kor/images/koglOpen/img_opentype3.jpg" alt="공공누리 3유형"' +
           '             style="position:absolute;left:20px;top:10%;vertical-align:middle;width:270px;"/> 본 공공저작물은 공공누리' +
           '        “출처표시+변경금지” 조건에 따라 이용할 수 있습니다.</div>');
        $('#koglOpen').css('display', 'inline');

    } else if (freeUseDesc == '4'){
        $('#koglOpen').text('');
        $('#koglOpen').html('<div className="codeView04 hide"' +
            '         style="position:relative;margin:0;padding:0;margin-top:30px;background:#fff;border:1px solid #dbdbdb;padding:35px 15px 35px 350px;font-size:16px;color:#292929;font-weight:bold;">' +
            '        <img src="/resource/kor/images/koglOpen/img_opentype4.jpg" alt="공공누리 4유형"' +
            '             style="position:absolute;left:20px;top:10%;vertical-align:middle;width:300px;"/> 본 공공저작물은 공공누리' +
            '        “출처표시+상업적이용금지+변경금지” 조건에 따라 이용할 수 있습니다.</div>');
        $('#koglOpen').css('display', 'inline');

    } else if (freeUseDesc == '5'){
        $('#koglOpen').text('');
        $('#koglOpen').html('<div className="codeView05 hide"' +
            '         style="position:relative;margin:0;padding:0;margin-top:20px;background:#fff;border:1px solid #dbdbdb;padding:17px 15px  17px 60px;font-size:12px;color:#292929;font-weight:bold;">' +
            '        <img src="/resource/kor/images/koglOpen/img_opentype0_1.jpg" alt="자유이용 불가"' +
            '             style="position:absolute;left:20px;top:25%;vertical-align:middle;width:27px;height:27px;"/> 자유이용이 불가합니다.' +
            '    </div>');
        $('#koglOpen').css('display', 'inline');

    }
});