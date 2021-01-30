# Ruby大作業文檔——基於Rails5的綫上書店Emporium

## 一、Models與參數要求

### 1.1 Author

**2個字段**：

- `first_name`

  string類型，作者姓名中的第一個單詞，要求必須存在。

- `last_name`

  string類型，作者姓名中的第二個單詞，要求必須存在。

**1個方法**：

- `name`

  返回`first_name`和`last_name`的拼接，即作者的全名。

**與其他實體關係**：

- `has_and_belongs_to_many :books`

  與書籍的多對多關係，一本書可以有多個作者，一個作者也可以寫多本書。

### 1.2 Publisher

**1個字段**：

- `name`

  string類型，出版社的名字，要求存在且唯一，長度在2-255字符之間。

**與其他實體關係**：

- `has_many :books`

  與書籍的一對多關係，一個出版社可以出版多本書。

### 1.3 Book

**6個字段**

- `title`

  string類型，書籍的名字，要求長度在1-255字符之間。

- `published_at`

  datetime類型，書籍的出版時間，要求必須存在。

- `isbn`

  string類型，書籍的isbn號，要求存在且唯一，且滿足正則表達式`/[0-9\-xX]{13}/`。

- `blurb`

  text類型，書籍的宣傳標語。

- `page_count`

  integer類型，書籍的總頁數，要求必須是一個整數。

- `price`

  float類型，書籍的價格，要求必須是一個數值。

**2個方法**

- `author_names`

  返回書籍所有作者姓名的拼接，用逗號分割。

- `self.latest`

  書籍類的方法，返回最新更新的10本書。

**與其他實體關係**

- `has_and_belongs_to_many :authors`

  與作者的多對多關係，一本書可以有多個作者，一個作者也可以寫多本書。

- `belongs_to :publisher`

  歸屬於出版社，一本書只能有一個出版社。

- `has_many :cart_items`

  與購物車條目的一對多關係，一本書可以對應於多個購物車項目中。

- `has_many :carts, :through => :cart_items`

  與購物車的多對多關係，通過購物車條目產生聯係。

- `has_many :comments`

  與評論的一對多關係，一本書可以有多條評論。

- `has_and_belongs_to_many :users`

  與用戶的多對多關係，語義為用戶與書籍的喜歡關係。
  
- `belongs_to :category`

  歸屬於類別，一本書只能歸屬於一個類。

### 1.4 Cart

**3個方法**

- `total`

  計算當前購物車的總價格。

- `add`

  添加新的書籍到購物車中。

- `remove`

  將書籍移出購物車。

**與其他實體關係**

- `has_many :cart_items`

  與購物車條目的一對多關係，一個購物車可以有多個購物車條目。

- `has_many :books, :through => :cart_items`

  與書籍的多對多關係，通過購物車條目建立聯係。

### 1.5 CartItem

**2個字段**

- `price`

  float類型，該購物車條目對應書籍的價格。

- `amount`

  integer類型，該購物車條目對應書籍的數量。

**與其他實體關係**

- `belongs_to :book`

  歸屬於一本書，即一個購物車條目只能表示購物車中一本書的數量和價格。

- `belongs_to :cart`

  歸屬於一個購物車。

### 1.6 User

**2個字段**

- `username`

  string類型，用戶名，必須存在且唯一。

- `password`

  string類型，密碼，必須存在。

**與其他實體關係**

- `has_many :comments`

  與評論的一對多關係，一個用戶可以發表多條評論。

- `has_and_belongs_to_many :books`

  與書籍的多對多關係，語義為用戶與書籍的喜歡關係。

### 1.7 Comment

**1個字段**

- `content`

  text類型，評論的具體內容。

**與其他實體關係**

- `belongs_to :book`

  歸屬於一本書，即一個評論僅是對一本書發表的。

- `belongs_to :user`

  歸屬於一個用戶，即一個評論僅能是一個用戶發表的。

### 1.8 Order

**16個字段**

- `email`

  string類型，電子郵件，要求滿足正則表達式`/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i `。

- `phone_number`

  string類型，電話號碼，要求長度在7-20字符之間。

- `ship_to_first_name`

  string類型，郵寄接收方的first_name，要求長度在2-255字符之間。

- `ship_to_last_name`

  string類型，郵寄接收方的last_name，要求長度在2-255字符之間。

- `ship_to_address`

  string類型，郵寄接收方的地址，要求長度在2-255字符之間。

- `ship_to_city`

  string類型，郵寄接收方所在城市，要求長度在2-255字符之間。

- `ship_to_postal_code`

  string類型，郵寄接收方的郵政編碼，要求長度在2-255字符之間。

- `ship_to_country`

  string類型，郵寄接收方的國家，要求長度在2-255字符之間。

- `customer_ip`

  string類型，送出訂單的ip地址。

- `status`

  string類型，訂單狀態，要求包含在`%w(open processed closed failed)`之中。

- `error_message`

  string類型，訂單出錯信息。

- `card_type`

  string類型，信用卡類型，要求包含在`['Visa', 'MasterCard', 'Discover']`之中。

- `card_number`

  string類型，信用卡卡號，要求長度在13-19字符之間。

- `card_expiration_month`

  string類型，信用卡到期月，要求包含在`%w(1 2 3 4 5 6 7 8 9 10 11 12)`之中。

- `card_expiration_year`

  string類型，信用卡到期年，要求包含在`%w(2016 2017 2018 2019 2020 2021)`之中。

- `card_verification_value`

  string類型，信用卡驗證值，要求長度在3-4字符之間。

**5個方法**

- `set_status`

  設定訂單的初始狀態為open。

- `total`

  計算訂單的金額。

- `process`

  將訂單的狀態設定為processed。

- `close`

  將訂單的狀態設定為closed。

- `closed?`

  判斷訂單的狀態是否為closed。

**與其他實體關係**

- `has_many :order_items`

  與訂單條目的一對多關係，一個訂單由多個訂單條目所組成。

- `has_many :books, :through => :order_items`

  與書籍的多對多關係，通過訂單條目建立聯係。

### 1.9 OrderItem

**2個字段**

- `price`

  float類型，該訂單條目對應書籍的價格。

- `amount`

  integer類型，該訂單條目對應書籍的數量。

**1個方法**

- `validate`

  驗證訂單條目是否合法。

**與其他實體關係**

- `belongs_to :book`

  歸屬於一本書，即一個訂單條目只能表示訂單中一本書的數量和價格。

- `belongs_to :cart`

  歸屬於一個訂單。

### 1.10 Category

**1個字段**：

- `name`

  string類型，類別名，要求存在且唯一，長度在2-255字符之間。

**與其他實體關係**：

- `has_many :books`

  與書籍的一對多關係，一個類別可以包含多本書。

## 二、Views與主要功能

### 2.0 頁面模板

對於頁面模板`application.html.erb`，其所實現的功能為：在每個頁面的上方顯示header和menu，下方顯示footer，右上方顯示登錄組件，在部分頁面的右方顯示購物車。除此之外，頁面模板還實現了對notice、alert和h1級別的標題的顯示功能。

對於menu，其上有諸多跳轉鏈接。對於普通用戶來說，點擊Home可以跳轉到主頁，點擊Authors可以跳轉到作者頁面，點擊Publishers可以跳轉到出版商頁面，點擊Books可以跳轉到書籍頁面，點擊Catalog可以跳轉到書籍列表頁面，點擊Favorites可以跳轉到收藏夾頁面，點擊About可以跳轉到關於頁面。除此之外，對於管理員用戶還可以通過menu中的Users和Orders鏈接分別進入用戶管理頁面和訂單管理頁面。

對於右上方顯示的登錄組件，在未登錄的時候會顯示Login和Signup兩個鏈接，分別可以點擊進入登入頁面和註冊頁面。在登入後顯示Logout鏈接，點擊可以登出。

對於右側的購物車頁面，點擊Proceed to Checkout鏈接可以進入checkout頁面進行下單操作，倘若沒有書籍，將會提示購物車為空且不進入checkout頁面。當添加圖書之後，在每一個圖書後都會有一個鏈接進行刪除操作，可以使該書籍商品數量減一；且在最後有一個Clear Cart的鏈接，點擊可以清空全部購物車。

### 2.1 主頁

歡迎頁面。給出跳轉到最新10本書頁面的鏈接，並顯示測試用的管理員帳號密碼和普通用戶的帳號密碼。

### 2.2 /authors 及其相關腳手架頁面

作者頁面。羅列出數據庫中全部的作者。對於普通用戶，只能點擊作者名進入對應的作者詳情頁面；對於管理員用戶，可以對作者進行新增、刪除、更新操作。

在作者詳情頁面(/authors/:id)，會顯示該作者所有的書籍。在此頁面可以對書籍進行喜歡操作和添加到購物車操作。

### 2.3 /publishers 及其相關腳手架頁面

出版商頁面。羅列出數據庫中全部出版商的名字。對於普通用戶，只能點擊出版商名字進入對應的出版商詳情頁面；對於管理員用戶，可以對出版商進行新增、刪除、更新操作。

在出版商詳情頁面(/publishers/:id)，會顯示該出版商所有的書籍。在此頁面可以對書籍進行喜歡操作和添加到購物車操作。

### 2.4 /categories 及其相關腳手架頁面

圖書分類頁面。羅列出數據庫中全部分類的名字。對於普通用戶，只能點擊出版商名字進入對應的分類詳情頁面；對於管理員用戶，可以對分類進行新增、刪除、更新操作。

在分類詳情頁面(/categories/:id)，會顯示該出版商所有的書籍。在此頁面可以對書籍進行喜歡操作和添加到購物車操作。

### 2.5 /books 及其相關腳手架頁面

書籍頁面。羅列出數據庫中全部書籍的名字。對於普通用戶，只能點擊書籍名字進入對應的書籍詳情頁面；對於管理員用戶，可以對書籍進行新增、刪除、更新操作。

在書籍詳情頁面(/books/:id)，會顯示該書籍的詳細信息，並可查看其所有評論（發表評論需在Catalog中的書籍詳情頁面進行）。

### 2.6 /catalog/index

書籍列表頁面。以用戶友好的形式展示書籍。用戶可在此頁面進行書籍的搜索、點擊書名進入書籍詳情頁面、對書籍添加喜歡、將書籍添加到購物車中。

### 2.7 /catalog/show

Catalog的書籍詳情頁面。在Catalog的書籍詳情頁面中，用戶可以對書籍添加喜歡、將書籍添加到購物車中、以及發表評論。如果用戶尚未登錄，用戶將無法發表評論。

### 2.8 /catalog/search

Catalog搜索頁面。用戶可以在此頁面對書籍信息進行搜索，並得到搜索結果。對於搜索結果，用戶可以點擊書名進入書籍詳情頁面、對書籍添加喜歡、將書籍添加到購物車中。

### 2.9 /catalog/latest

Catalog最新10本書頁面。再次頁面用戶可以查看最新發布的10本書、點擊書名進入書籍詳情頁面、對書籍添加喜歡、將書籍添加到購物車中。

### 2.10 /favorites

收藏夾頁面。如果用戶已經登錄，此頁面將顯示用戶添加過喜歡的書籍。如果用戶尚未登錄，將跳轉到登錄頁面。

### 2.11 /about

關於頁面。顯示該網站的介紹信息。

### 2.12 /users 及其相關腳手架頁面

用戶管理頁面。僅對管理員可見，管理員可以在此頁面查看所有用戶的用戶名和密碼，也可以進行增加、刪除、更新操作。

### 2.13 /order/index

訂單管理頁面。僅對管理員可見，管理員可以在此頁面查看處於不同狀態的訂單，並進入不同訂單的訂單展示頁面查看詳情與進行後續處理操作。

### 2.14 /order/show

訂單展示頁面。僅對管理員可見，管理員可對訂單狀態進行修改。如進行close操作將訂單關閉，意味著已經處理完該訂單。

### 2.15 /checkout/index

下單頁面。用戶點擊Proceed to Checkout後進行跳轉。該頁面用戶需要填寫聯係信息、郵寄信息、支付信息，填寫完畢後點擊Place Order即可成功添加訂單信息。該訂單信息則可被管理員在訂單管理頁面看到。

### 2.16 /checkout/thank_you

感謝頁面。下單成功後將進入該頁面。該頁面顯示Thank you，並給出相應的發票信息。

## 三、Controllers與部分功能的實現細節

### 3.1 application_controller.rb中的helper方法

- `current_user`

  如當前已登入，返回當前用戶對象，否則返回`nil`。用於判斷當前是否已經登入。

- `admin?`

  判斷當前是否處於管理員狀態。采用的判斷方法是，如果當前用戶的用戶名是`"admin"`，則認為其為管理員賬戶，返回`true`。如需要新增管理員，可以在此處的代碼中添加新的管理員用戶名。

  ```ruby
    def admin?
      current_user && current_user.username == "admin"
    end
  ```

- `authenticate`

  如果沒有登入，則重定向到登入頁面。用於`before_action`中對需要登入之後才能訪問的頁面進行控制。

- `authenticate_admin`

  如果不是管理員賬戶，則重定向到上一個頁面。用於`before_action`中對需要管理員才能訪問的頁面進行控制。

  ```ruby
    def authenticate_admin
      redirect_back fallback_location: home_path, alert: 'Administrator Authority Needed!' unless admin?
    end
  ```

- `initialize_cart`

  用於對需要顯示購物車的頁面進行購物車的初始化。同樣是采用`before_action`進行調用。

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

### 3.2 用戶對書籍添加喜歡與取消喜歡

在book_controller.rb中添加如下代碼：

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

在route.rb中對books的路由進行如下修改：

```ruby
  resources :books do
    resources :comments
    member do
      post 'like'
      post 'unlike'
    end
  end
```

這樣，就可以通過簡單的連接執行指定的添加多對多關係的動作。

### 3.3 @page_title的設定

在Controller中的各函數中依次添加對應想要設定的頁面標題，如about頁面：

```ruby
  def about
    @page_title = 'About Emporium'
  end
```

並在頁面模板中進行如下的修改：

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

這樣，當在Controller中添加`@page_title`的定義後，就可以將瀏覽器的標題修改為`@page_title`對應的字符串，並自動在`content`塊的最前面添加h1大小的`@page_title`標題。

### 3.4 搜索功能的實現

搜索功能實現起來也並不是非常地複雜，只需要使用model的where方法並進行模糊查詢即可。具體代碼如下所示：

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

