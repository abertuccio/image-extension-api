
const array = [ { category: 'LIST', availableFolders: [1,2,3,4] },
{ category: 'PRODUCT', availableFolders: [5555555] },
{ category: 'LIST', availableFolders: [5,6,7,8] },
{ category: 'LIST', availableFolders: [9] },
{ category: 'LIST', availableFolders: [10,11] } ];




const res = array.reduce((p,c)=>{

       let existe = false;

        p.forEach((e,i)=>{
            if(e.category === c.category){
                existe = true;
                p[i].availableFolders = p[i].availableFolders.concat(c.availableFolders);
            }
        });

        if(!existe){
            p.push({category:c.category, availableFolders:c.availableFolders});
        }


    return p;    
}
,[]);

// console.log(res)  

res.forEach(e=>{
    console.log(e.availableFolders);
})