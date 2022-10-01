//manages the token on the local localStorage

let set = (value) => {
    window.localStorage.setItem('2020-auth-token', value)
}

let get = () => {
  return window.localStorage.getItem("2020-auth-token")
}

let clear = () => {
  window.localStorage.removeItem("2020-auth-token")
}

let token = {
  set,
  get,
  clear
}

export default token
