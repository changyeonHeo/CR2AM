
function search(target){
    var checkWord = $("#productInput").val();
    var searchType = $('input[name="searchType"]:checked').val(); 
    var productList = $("#productList");
    productList.empty();
    $.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: 'js/allsearch.js', 
        error: function(err){
            console.log(err);
        },
        success: function(data){
            data.forEach((product)=>{
              
                if(product['slug'].includes(checkWord)){
                    if(!productList.text().includes(product['name'])){
                        productList.append(
							`<div data-v-c9703de2="" tabindex="0" class="suggest-list-item">
								<a data-v-3c42ca29="" data-v-c9703de2="" href="searchResult.do?cmd=${product['searchType']}&subject=${product['name']}">
							 <div data-v-3c42ca29="" class="title">
								<p data-v-3c42ca29="" class="suggest_title"> ${product['name']} </p>
								</a>
							</div> `
						);    
                    }
                }
            });
            if(checkWord == ''){
                productList.empty();
            }
        }
    });
}

function select(target){
    const selected = document.getElementById("selected");
    selected.innerText = target.innerText;
}