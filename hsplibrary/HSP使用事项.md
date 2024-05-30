# HSP的使用事项

[**官方HSP开发指导**](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/in-app-hsp.md)

1. 依然需要先 **Make Module** 生成产物，
   路径为 **build/default/outputs/default/** 编译产物为.har和.hsp文件。
2. 注意打包运行要编辑配置使用多hap模式，选中entry和hsplib
3. entry模块跳转hsp中的页面可以使用如下方式，
```typescript
@bundle:包名（bundleName）/模块名（moduleName）/路径/页面所在的文件名(不加.ets后缀)'   
```
代码中的路径为 
```typescript
router.pushUrl({ url: "@bundle:com.hmos.simple/hsplibrary/ets/pages/HspFirstPage" })
```
特别注意路径中不能包含 **_src/main/_** 加上的话会报路径找不到的错误，这点着实奇怪。
```typescript
page: @bundle:com.hmos.simple/hsplibrary/src/main/ets/pages/HspFirstPage.js
Error message: cannot find record 'com.hmos.simple/hsplibrary/src/main/ets/pages/HspFirstPage', please check the request path.
```
4. 当我从entry模块跳转到hsp模块的页面，这时候在hsp中的第一页面跳转到hsp第二页面
不能直接使用 **pages/HspPage2** 页需要使用上面的方式，这点也很奇怪。