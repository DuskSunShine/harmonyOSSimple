# HAR的使用坑点
 [**官方HAR开发指导**](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/quick-start/har-package.md)

1. 首先需要使用 *Make Module* 生成产物，包括打包好的.har包。
   路径为 **build/default/outputs/default/*.har**
2. 构建支持的架构需要在模块下 **build-profile.json5** 中添加如下设置，
   但是注意模拟器应该是x86_64的。配置的时候如果需要模拟器运行还是要加上的。
   ```
   "buildOption": {
    "externalNativeOptions": {
      "path": "./src/main/cpp/CMakeLists.txt",
      "arguments": "",
      "cppFlags": "",
   //这里默认只有x86_64的，按需添加需要支持的架构
      "abiFilters": ["arm64-v8a","armeabi-v7a"]
    },
    }
    ``` 
3. 引入方式

   引入方式有三种，测试了在同一工程下都可编译运行。
   三种方式如下,在需要引入的模块的 **oh-package.json5** 中添加依赖
    1. 直接引入整个静态库的module,将整个module引入到需要的模块，
       对应该模块 **oh_modules** 下会加入整个module的代码
    2. 引入module下打包好的.har，发现效果和第一种差不多
    3. 在需要引入的模块创建libs目录，将需要的.har放在该目录
       可以自行对比引入后对应模块 **oh_modules** 的变化
    ```
   "dependencies": {
    //最好是引用打包好的har或发布到远程仓库的har
    //"harlibrary": "file:../harlibrary/build/default/outputs/default/harlibrary.har"
    "harlibrary": "file:../entry/libs/harlibrary.har"
    //"harlibrary": "file:../harlibrary"
    }
   ```
4. 关于本地引用har,如果对har模块有修改，记得引入的时候删除引入模块下 **oh_modules**
   中对应的har和**oh_modules/.ohpm**下对应的har,重新执行 **ohpm install** 不然更新不了。
5. 关于Napi的使用，需要在har模块的 **index.ets** 对native方法包一层
   ```
   //导出页面
   import { add } from 'libharlibrary.so'
   //导出c 方法
   export function HarNapiAdd(a:number,b:number){
   return add(a,b)
   }
   //导出c 方法箭头函数写法
   export const HarNapiAdd2=(a:number,b:number)=>{
   return add(a,b)
   }
   ```
6. 关于引入方使用har中的page或跳转到har中的page貌似只能通过
   [命名路由](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-routing.md#%E5%91%BD%E5%90%8D%E8%B7%AF%E7%94%B1)
   的方式进行跳转
   但是这个只在api10+以后支持。
   尝试了使用如下方式没有作用，连报错都没有。
   ```typescript
    @bundle:包名（bundleName）/模块名（moduleName）/路径/页面所在的文件名(不加.ets后缀)'   
   ```