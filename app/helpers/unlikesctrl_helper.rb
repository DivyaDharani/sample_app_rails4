module UnlikesctrlHelper

def my_unlike_link(m_id,url,meth)
	url=url+"#{m_id}"	
	name="Unlike"
	color="blue"
	unlikeobj=Like.where(:micropost_id=>m_id,:user_id=>current_user.id).first
	if unlikeobj && unlikeobj.like_or_unlike=="unlike" 
		name="Unliked"
		color="red"
	end
	return "<a href='#{url}' data-method='#{meth}' style='color:#{color};'>#{name}</a>".html_safe
end
def unlikes(m_id)
	mpost=Micropost.find(m_id)
	count=mpost.num_unlikes
	if(count==1)
		return "#{count} unlike"
	else
		return	"#{count} unlikes"
	end
end
end
