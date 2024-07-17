package wojiubuxinle;

public class node {
	//以下是数值
	public String phonenumber;
	public String name;
	public String department;
	public String email;
	public node next;	// 结点 node
	node(String p,String n,String d,String e){	//可以定义一个有参构造方法，也可以定义一个无参构造方法
		phonenumber=p;
		name=n;
		department=d;
		email=e;
	}
	node() {
		phonenumber="";
		name="";
		department="";
		email="";
	}


public void add(String p,String n,String d,String e) {
	node newnode = new node(p,n,d,e);
	if(this.next == null)
		this.next = newnode;
	else
		this.next.add(p,n,d,e);
}

public node getend(node head) {
	while(head.next!=null)
	{head=head.next;	
}
	return head;
}

void quicksort1(node head, node end){  
    if(head ==null || head == end)             //如果头指针为空或者链表为空，直接返回  
        return ;  
    String t;  
    node P = head.next;                  //用来遍历的指针  
    node small = head;  
    while( P != end){  
        if( (P.phonenumber).compareTo(head.phonenumber)<0){      //对于小于轴的元素放在左边  
            small = small.next;  
            t = small.phonenumber;  
            small.phonenumber = P.phonenumber;  
            P.phonenumber= t;  
            
            t = small.name;  
            small.name = P.name;  
            P.name= t;
            
            t = small.department;  
            small.department = P.department;  
            P.department= t;
            
            t = small.email;  
            small.email = P.email;  
            P.email= t;
        }  
        P = P.next;  
    }  //下面是，遍历完后，对左轴元素与small指向的元素交换  
    t = head.phonenumber;                           
    head.phonenumber = small.phonenumber;  
    small.phonenumber = t;  
    
    t = head.name;                           
    head.name = small.name;  
    small.name = t;  
    
    t = head.department;                           
    head.department = small.department;  
    small.department = t;  
    
    t = head.email;                           
    head.email = small.email;  
    small.email = t;  
    
    quicksort1(head, small);                     //对左右进行递归  
    quicksort1(small.next, end);  
}  

void quicksort2(node head, node end){  
    if(head ==null || head == end)             //如果头指针为空或者链表为空，直接返回  
        return ;  
    String t;  
    node P = head.next;                  //用来遍历的指针  
    node small = head;  
    while( P!= end){  
        if( (P.name).compareTo(head.name)<0){      //对于小于轴的元素放在左边  
            small = small.next;  
            t = small.phonenumber;  
            small.phonenumber = P.phonenumber;  
            P.phonenumber= t;  
            
            t = small.name;  
            small.name = P.name;  
            P.name= t;
            
            t = small.department;  
            small.department = P.department;  
            P.department= t;
            
            t = small.email;  
            small.email = P.email;  
            P.email= t;
        }  
        P = P.next;  
    }  //下面是，遍历完后，对左轴元素与small指向的元素交换  
    t = head.phonenumber;                           
    head.phonenumber = small.phonenumber;  
    small.phonenumber = t;  
    
    t = head.name;                           
    head.name = small.name;  
    small.name = t;  
    
    t = head.department;                           
    head.department = small.department;  
    small.department = t;  
    
    t = head.email;                           
    head.email = small.email;  
    small.email = t;  
    
    quicksort2(head, small);                     //对左右进行递归  
    quicksort2(small.next, end);  
} 

}