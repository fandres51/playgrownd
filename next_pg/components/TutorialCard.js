import React from 'react'

export default function TutorialCard({name, number}) {
  return (
    <div style={{
        backgroundColor: 'white',
        boxShadow: '0px 0px 5px 0px rgba(0,0,0,0.25)',
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        padding: 15,
        margin: 20,
        borderRadius: 10
    }}>
        <div>
            {name}
        </div>
        <div style={{
            display: 'flex',
            flexDirection: 'row'
        }}>
            <div>{number}</div>
            <div style={{
                width: 10
            }}></div>
            <div>
                <button>
                    ^
                </button>
            </div>
        </div>
    </div>
  )
}
