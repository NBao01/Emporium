# Ruby大作业文档——基于Rails5的线上书店Emporium

## 一、Models与参数要求

### 1.1 Author

**2个字段**：

- `first_name`

  string类型，作者姓名中的第一个单词，要求必须存在。

- `last_name`

  string类型，作者姓名中的第二个单词，要求必须存在。

**1个方法**：

- `name`

  返回`first_name`和`last_name`的拼接，即作者的全名。

**与其他实体关系**：

- `has_and_belongs_to_many :books`

  与书籍的多对多关系，一本书可以有多个作者，一个作者也可以写多本书。

### 1.2 Publisher

**1个字段**：

- `name`

  string类型，出版社的名字，要求存在且唯一，长度在2-255字符之间。

**与其他实体关系**：

- `has_many :books`

  与书籍的一对多关系，一个出版社可以出版多本书。

### 1.3 Book

**6个字段**

- `title`

  string类型，书籍的名字，要求长度在1-255字符之间。

- `published_at`

  datetime类型，书籍的出版时间，要求必须存在。

- `isbn`

  string类型，书籍的isbn号，要求存在且唯一，且满足正则表达式`/[0-9\-xX]{13}/`。

- `blurb`

  text类型，书籍的宣传标语。

- `page_count`

  integer类型，书籍的总页数，要求必须是一个整数。

- `price`

  float类型，书籍的价格，要求必须是一个数值。

**2个方法**

- `author_names`

  返回书籍所有作者姓名的拼接，用逗号分割。

- `self.latest`

  书籍类的方法，返回最新更新的10本书。

**与其他实体关系**

- `has_and_belongs_to_many :authors`

  与作者的多对多关系，一本书可以有多个作者，一个作者也可以写多本书。

- `belongs_to :publisher`

  归属于出版社，一本书只能有一个出版社。

- `has_many :cart_items`

  与购物车条目的一对多关系，一本书可以对应于多个购物车项目中。

- `has_many :carts, :through => :cart_items`

  与购物车的多对多关系，通过购物车条目产生联系。

- `has_many :comments`

  与评论的一对多关系，一本书可以有多条评论。

- `has_and_belongs_to_many :users`

  与用户的多对多关系，语义为用户与书籍的喜欢关系。
  
- `belongs_to :category`

  归属于类别，一本书只能归属于一个类。

### 1.4 Cart

**3个方法**

- `total`

  计算当前购物车的总价格。

- `add`

  添加新的书籍到购物车中。

- `remove`

  将书籍移出购物车。

**与其他实体关系**

- `has_many :cart_items`

  与购物车条目的一对多关系，一个购物车可以有多个购物车条目。

- `has_many :books, :through => :cart_items`

  与书籍的多对多关系，通过购物车条目建立联系。

### 1.5 CartItem

**2个字段**

- `price`

  float类型，该购物车条目对应书籍的价格。

- `amount`

  integer类型，该购物车条目对应书籍的数量。

**与其他实体关系**

- `belongs_to :book`

  归属于一本书，即一个购物车条目只能表示购物车中一本书的数量和价格。

- `belongs_to :cart`

  归属于一个购物车。

### 1.6 User

**2个字段**

- `username`

  string类型，用户名，必须存在且唯一。

- `password`

  string类型，密码，必须存在。

**与其他实体关系**

- `has_many :comments`

  与评论的一对多关系，一个用户可以发表多条评论。

- `has_and_belongs_to_many :books`

  与书籍的多对多关系，语义为用户与书籍的喜欢关系。

### 1.7 Comment

**1个字段**

- `content`

  text类型，评论的具体内容。

**与其他实体关系**

- `belongs_to :book`

  归属于一本书，即一个评论仅是对一本书发表的。

- `belongs_to :user`

  归属于一个用户，即一个评论仅能是一个用户发表的。

### 1.8 Order

**16个字段**

- `email`

  string类型，电子邮件，要求满足正则表达式`/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i `。

- `phone_number`

  string类型，电话号码，要求长度在7-20字符之间。

- `ship_to_first_name`

  string类型，邮寄接收方的first_name，要求长度在2-255字符之间。

- `ship_to_last_name`

  string类型，邮寄接收方的last_name，要求长度在2-255字符之间。

- `ship_to_address`

  string类型，邮寄接收方的地址，要求长度在2-255字符之间。

- `ship_to_city`

  string类型，邮寄接收方所在城市，要求长度在2-255字符之间。

- `ship_to_postal_code`

  string类型，邮寄接收方的邮政编码，要求长度在2-255字符之间。

- `ship_to_country`

  string类型，邮寄接收方的国家，要求长度在2-255字符之间。

- `customer_ip`

  string类型，送出订单的ip地址。

- `status`

  string类型，订单状态，要求包含在`%w(open processed closed failed)`之中。

- `error_message`

  string类型，订单出错信息。

- `card_type`

  string类型，信用卡类型，要求包含在`['Visa', 'MasterCard', 'Discover']`之中。

- `card_number`

  string类型，信用卡卡号，要求长度在13-19字符之间。

- `card_expiration_month`

  string类型，信用卡到期月，要求包含在`%w(1 2 3 4 5 6 7 8 9 10 11 12)`之中。

- `card_expiration_year`

  string类型，信用卡到期年，要求包含在`%w(2016 2017 2018 2019 2020 2021)`之中。

- `card_verification_value`

  string类型，信用卡验证值，要求长度在3-4字符之间。

**5个方法**

- `set_status`

  设定订单的初始状态为open。

- `total`

  计算订单的金额。

- `process`

  将订单的状态设定为processed。

- `close`

  将订单的状态设定为closed。

- `closed?`

  判断订单的状态是否为closed。

**与其他实体关系**

- `has_many :order_items`

  与订单条目的一对多关系，一个订单由多个订单条目所组成。

- `has_many :books, :through => :order_items`

  与书籍的多对多关系，通过订单条目建立联系。

### 1.9 OrderItem

**2个字段**

- `price`

  float类型，该订单条目对应书籍的价格。

- `amount`

  integer类型，该订单条目对应书籍的数量。

**1个方法**

- `validate`

  验证订单条目是否合法。

**与其他实体关系**

- `belongs_to :book`

  归属于一本书，即一个订单条目只能表示订单中一本书的数量和价格。

- `belongs_to :cart`

  归属于一个订单。

### 1.10 Category

**1个字段**：

- `name`

  string类型，类别名，要求存在且唯一，长度在2-255字符之间。

**与其他实体关系**：

- `has_many :books`

  与书籍的一对多关系，一个类别可以包含多本书。

## 二、Views与主要功能

### 2.0 页面模板

对于页面模板`application.html.erb`，其所实现的功能为：在每个页面的上方显示header和menu，下方显示footer，右上方显示登录组件，在部分页面的右方显示购物车。除此之外，页面模板还实现了对notice、alert和h1级别的标题的显示功能。

对于menu，其上有诸多跳转链接。对于普通用户来说，点击Home可以跳转到主页，点击Authors可以跳转到作者页面，点击Publishers可以跳转到出版商页面，点击Books可以跳转到书籍页面，点击Catalog可以跳转到书籍列表页面，点击Favorites可以跳转到收藏夹页面，点击About可以跳转到关于页面。除此之外，对于管理员用户还可以通过menu中的Users和Orders链接分别进入用户管理页面和订单管理页面。

对于右上方显示的登录组件，在未登录的时候会显示Login和Signup两个链接，分别可以点击进入登入页面和注册页面。在登入后显示Logout链接，点击可以登出。

对于右侧的购物车页面，点击Proceed to Checkout链接可以进入checkout页面进行下单操作，倘若没有书籍，将会提示购物车为空且不进入checkout页面。当添加图书之后，在每一个图书后都会有一个链接进行删除操作，可以使该书籍商品数量减一；且在最后有一个Clear Cart的链接，点击可以清空全部购物车。

### 2.1 主页

欢迎页面。给出跳转到最新10本书页面的链接，并显示测试用的管理员帐号密码和普通用户的帐号密码。

### 2.2 /authors 及其相关脚手架页面

作者页面。罗列出数据库中全部的作者。对于普通用户，只能点击作者名进入对应的作者详情页面；对于管理员用户，可以对作者进行新增、删除、更新操作。

在作者详情页面(/authors/:id)，会显示该作者所有的书籍。在此页面可以对书籍进行喜欢操作和添加到购物车操作。

### 2.3 /publishers 及其相关脚手架页面

出版商页面。罗列出数据库中全部出版商的名字。对于普通用户，只能点击出版商名字进入对应的出版商详情页面；对于管理员用户，可以对出版商进行新增、删除、更新操作。

在出版商详情页面(/publishers/:id)，会显示该出版商所有的书籍。在此页面可以对书籍进行喜欢操作和添加到购物车操作。

### 2.4 /categories 及其相关脚手架页面

图书分类页面。罗列出数据库中全部分类的名字。对于普通用户，只能点击出版商名字进入对应的分类详情页面；对于管理员用户，可以对分类进行新增、删除、更新操作。

在分类详情页面(/categories/:id)，会显示该出版商所有的书籍。在此页面可以对书籍进行喜欢操作和添加到购物车操作。

### 2.5 /books 及其相关脚手架页面

书籍页面。罗列出数据库中全部书籍的名字。对于普通用户，只能点击书籍名字进入对应的书籍详情页面；对于管理员用户，可以对书籍进行新增、删除、更新操作。

在书籍详情页面(/books/:id)，会显示该书籍的详细信息，并可查看其所有评论（发表评论需在Catalog中的书籍详情页面进行）。

### 2.6 /catalog/index

书籍列表页面。以用户友好的形式展示书籍。用户可在此页面进行书籍的搜索、点击书名进入书籍详情页面、对书籍添加喜欢、将书籍添加到购物车中。

### 2.7 /catalog/show

Catalog的书籍详情页面。在Catalog的书籍详情页面中，用户可以对书籍添加喜欢、将书籍添加到购物车中、以及发表评论。如果用户尚未登录，用户将无法发表评论。

### 2.8 /catalog/search

Catalog搜索页面。用户可以在此页面对书籍信息进行搜索，并得到搜索结果。对于搜索结果，用户可以点击书名进入书籍详情页面、对书籍添加喜欢、将书籍添加到购物车中。

### 2.9 /catalog/latest

Catalog最新10本书页面。再次页面用户可以查看最新发布的10本书、点击书名进入书籍详情页面、对书籍添加喜欢、将书籍添加到购物车中。

### 2.10 /favorites

收藏夹页面。如果用户已经登录，此页面将显示用户添加过喜欢的书籍。如果用户尚未登录，将跳转到登录页面。

### 2.11 /about

关于页面。显示该网站的介绍信息。

### 2.12 /users 及其相关脚手架页面

用户管理页面。仅对管理员可见，管理员可以在此页面查看所有用户的用户名和密码，也可以进行增加、删除、更新操作。

### 2.13 /order/index

订单管理页面。仅对管理员可见，管理员可以在此页面查看处于不同状态的订单，并进入不同订单的订单展示页面查看详情与进行后续处理操作。

### 2.14 /order/show

订单展示页面。仅对管理员可见，管理员可对订单状态进行修改。如进行close操作将订单关闭，意味着已经处理完该订单。

### 2.15 /checkout/index

下单页面。用户点击Proceed to Checkout后进行跳转。该页面用户需要填写联系信息、邮寄信息、支付信息，填写完毕后点击Place Order即可成功添加订单信息。该订单信息则可被管理员在订单管理页面看到。

### 2.16 /checkout/thank_you

感谢页面。下单成功后将进入该页面。该页面显示Thank you，并给出相应的发票信息。

## 三、Controllers与部分功能的实现细节

### 3.1 application_controller.rb中的helper方法

- `current_user`

  如当前已登入，返回当前用户对象，否则返回`nil`。用于判断当前是否已经登入。

- `admin?`

  判断当前是否处于管理员状态。采用的判断方法是，如果当前用户的用户名是`"admin"`，则认为其为管理员账户，返回`true`。如需要新增管理员，可以在此处的代码中添加新的管理员用户名。

  ```ruby
    def admin?
      current_user && current_user.username == "admin"
    end
  ```

- `authenticate`

  如果没有登入，则重定向到登入页面。用于`before_action`中对需要登入之后才能访问的页面进行控制。

- `authenticate_admin`

  如果不是管理员账户，则重定向到上一个页面。用于`before_action`中对需要管理员才能访问的页面进行控制。

  ```ruby
    def authenticate_admin
      redirect_back fallback_location: home_path, alert: 'Administrator Authority Needed!' unless admin?
    end
  ```

- `initialize_cart`

  用于对需要显示购物车的页面进行购物车的初始化。同样是采用`before_action`进行调用。

  ```ruby
    def initialize_cart
      if session[:cart_id]
        @cart = Cart.find(session[:cart_id])
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
  ```

### 3.2 用户对书籍添加喜欢与取消喜欢

在book_controller.rb中添加如下代码：

```ruby
  def like
    @book.users << current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: catalog_index_path, notice: @book.title + ' is added to your favorites' }
      format.json { head :no_content }
    end
  end

  def unlike
    @book.users.delete(current_user)
    respond_to do |format|
      format.html { redirect_back fallback_location: catalog_index_path, notice: @book.title + ' is removed from your favorites' }
      format.json { head :no_content }
    end
  end
```

在route.rb中对books的路由进行如下修改：

```ruby
  resources :books do
    resources :comments
    member do
      post 'like'
      post 'unlike'
    end
  end
```

这样，就可以通过简单的连接执行指定的添加多对多关系的动作。

### 3.3 @page_title的设定

在Controller中的各函数中依次添加对应想要设定的页面标题，如about页面：

```ruby
  def about
    @page_title = 'About Emporium'
  end
```

并在页面模板中进行如下的修改：

```erb
<html>
  <head>
    <title><%= @page_title || 'Emporium' %></title>
    <!-- ... -->
  </head>
  <body>
    <!-- ... -->
    <div id="content">
      <h1><%= "#{@page_title}" if @page_title %></h1>
      <h2><%= alert %></h2>
      <%= yield %>
    </div>
    <!-- ... -->
  </body>
</html>
```

这样，当在Controller中添加`@page_title`的定义后，就可以将浏览器的标题修改为`@page_title`对应的字符串，并自动在`content`块的最前面添加h1大小的`@page_title`标题。

### 3.4 搜索功能的实现

搜索功能实现起来也并不是非常地复杂，只需要使用model的where方法并进行模糊查询即可。具体代码如下所示：

```ruby
  def search
    @page_title = "Search"
    if params[:commit] == "Search" || params[:q]
      @books = Book.where("title LIKE ?", "%" + params[:q] + "%")
      unless @books.size > 0
        flash.now[:notice] = "No books found matching your criteria"
      end
    end
  end
```

