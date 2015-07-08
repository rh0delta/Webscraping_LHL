class Comment 

  attr_accessor :user_name, :comment_text 

  def initialize(user_name, comment_text)
    @user_name = user_name
    @comment_text = comment_text
  end

  def to_s
    "User: #{@user_name} Comment: #{@comment_text}"
  end

end