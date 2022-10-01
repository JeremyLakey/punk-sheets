import axios from 'axios'

const getUser = async (jwt) => {
  try {
    let response = await axios.get('/api/user', {
      headers: { '2020-auth-token': jwt },
    })
    let data = response.data
    console.log(data)
    return data
  } catch (err) {
    console.error(err)
    return null
  }
}

const getSheets = async (jwt) => {
  try {
    let response = await axios.get('/api/sheet', {
      headers: { '2020-auth-token': jwt },
    })
    let data = response.data
    return data
  } catch (err) {
    console.error(err)
    return null
  }
}

const registerUser = async (username, email, password) => {
  try {
    let response = await axios.post(
      '/api/user/',
      { username, email, password },
      {
        headers: {
          'Content-Type': 'application/json',
        },
      }
    )
    return response.data
  } catch (err) {
    console.error(err)
    return null
  }
}

const loginUser = async (email, password) => {
  try {
    let response = await axios.post(
      '/api/user/login',
      { email, password },
      {
        headers: {
          'Content-Type': 'application/json',
        },
      }
    )
    return response.data
  } catch (err) {
    console.error(err)
    return null
  }
}

const deleteUser = async (jwt) => {
  try {
    let response = await axios.delete('/api/user', {
      headers: { '2020-auth-token': jwt },
    })
    console.log(response)
    return true
  } catch (err) {
    console.error(err)
    return false
  }
}

const addSheet = async (jwt, sheet) => {
  try {
    let response = await axios.post('/api/sheet', sheet, {
      headers: {
        'Content-Type': 'application/json',
        '2020-auth-token': jwt,
      },
    })
    return response.data
  } catch (error) {
    console.log(error)
    return null
  }
}

const editSheet = async (jwt, id, edit) => {
  try {
    let response = await axios.put(`/api/sheet/${id}`, edit, {
      headers: {
        'Content-Type': 'application/json',
        '2020-auth-token': jwt,
      },
    })
    return response.data
  } catch (error) {
    console.log(error)
    return null
  }

  //Example code for editting a sheet
  //await editSheet(token.get(), sheet._id, { public: !sheet.public })
}

const deleteSheet = async (jwt, id) => {
  try {
    let response = await axios.delete(`/api/sheet/${id}`, {
      headers: {
        '2020-auth-token': jwt,
      },
    })
    return response.data
  } catch (error) {
    console.log(error)
    return null
  }
}

export {
  getUser,
  getSheets,
  registerUser,
  loginUser,
  deleteUser,
  addSheet,
  editSheet,
  deleteSheet,
}
