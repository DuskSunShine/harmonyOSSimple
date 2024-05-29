//导出页面
import { add } from 'libharlibrary.so'
export { MainPage } from './src/main/ets/components/mainpage/MainPage'
//导出c 方法
export function HarNapiAdd(a:number,b:number){
  return add(a,b)
}
//导出c 方法箭头函数写法
export const HarNapiAdd2=(a:number,b:number)=>{
  return add(a,b)
}