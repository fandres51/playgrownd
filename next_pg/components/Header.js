import React from 'react'

export default function Header() {
  return (
    <div style={{
        backgroundColor: 'white',
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'flex-end',
        padding: 20,
        boxShadow: '0px 0px 10px 0px rgba(0,0,0,0.75)'
    }}>
        <button style={{
            backgroundColor: 'white',
            color: 'black',
            border: 'none',
            textDecoration: 'underline',
            cursor: 'pointer'
        }}>
            add request
        </button>
        <div style={{
            width: 20
        }}></div>
        <button style={{
            backgroundColor: 'white',
            color: 'black',
            border: 'none',
            textDecoration: 'underline',
            cursor: 'pointer'
        }}>
            sign out
        </button>
    </div>
  )
}
