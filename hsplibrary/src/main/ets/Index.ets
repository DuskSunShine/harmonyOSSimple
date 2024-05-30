import { addHSPNapi } from 'libhsplibrary.so'

export { addHSPNormal } from "./utils/Calc"

export {HspFirstPage} from "./pages/HspFirstPage"

export const addHSPofC=(a:number,b:number)=>{
  return addHSPNapi(a,b)
}

export class Res{
  static getColor(){
    return $r('app.color.white')
  }
  static getHspColor(){
    return $r('app.color.hspColor')
  }
  static getIcon(){
    return $r('app.media.setting')
  }
}
