# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Card.delete_all

cards = [
    {
        name: "Reliquary Tower",
        price: 4.50,
        qty: 4,
        condition: 'NM',
        user: User.first
    },
    {
        name: "Command Tower",
        price: 8.40,
        qty: 1,
        condition: 'LP',
        user: User.first
    },
    {
        name: "Island",
        price: 2.50,
        qty: 26,
        condition: 'NM',
        user: User.first
    },
    {
        name: "Mountain",
        price: 2.50,
        qty: 30,
        condition: 'NM',
        user: User.first
    },
    {
        name: "Forest",
        price: 2.50,
        qty: 26,
        condition: 'NM',
        user: User.first
    },
    {
        name: "Plains",
        price: 2.50,
        qty: 24,
        condition: 'NM',
        user: User.first
    },
    {
        name: "Memory Jar",
        price: 83.99,
        qty: 4,
        condition: 'LP',
        user: User.first
    },
    {
        name: "Sol ring",
        price: 7.90,
        qty: 7,
        condition: 'LP',
        user: User.first
    },
    {
        name: "Cyclonic Rift",
        price: 24.50,
        qty: 1,
        condition: 'NM',
        user: User.first
    },
    {
        name: "Swamp",
        price: 2.50,
        qty: 23,
        condition: 'NM',
        user: User.first
    },

]

Card.create(cards)