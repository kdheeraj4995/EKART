###Config
- ApplicationContextConfig.java : Contains datasource information and hibernate configuration.

###Controllers 
 All the classes are annotated with @Controller and @RestController so that they can be scanned by spring MVC
 -	AdminCategoryController :  Contains MVC controller methods for admin Product Crud.
 -	AdminProductController : Contains MVC controller methods for admin Supllier Crud.
 -	AdminSupplierController : Contains MVC controller methods for admin Category Crud.
 -	CartController : MVC controller methods for user Cart functions.
 -	DynamicNavbar : MVC controller methods for basic Navigation.
 -	ImageController : MVC controller method for user Image retrieval.
 -  LoginController : MVC controller methods for login and registration.
 
 
###Models
 Contains all model classes.These models will be scanned by hibernate, so as to facilitate easy data manipulation using Hibernate ORM.
 -   Cart.java
 -   Category.java
 -   Product.java
 -   Supplier.java
 -   UsersDetails.java
 
###DAO 
 Contains all DAO interfaces and DAOImpls containing RAW persistence Logic. 
 - CartDAO.java
 - CartDAOImpl.java
 - CategoryDAO.java
 - CategoryDAOImpl.java
 - ProductDAO.java
 - ProductDAOImpl.java
 - SupplierDAO.java
 - SupplierDAOImpl.java
 - UsersDetailsDAO.java
 - UsersDetailsDAOImpl.java
