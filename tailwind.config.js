/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./templates/**/*.html", // Scan HTML templates
        "./static/**/*.js", // Scan JS files
        "./static/**/*.css", // Scan CSS files
    ],
    theme: {
        extend: {
            colors: {
                primary: "var(--primary)",
                secondary: "var(--secondary)",
                tertiary: "var(--tertiary)",
            },
        },
    },
    plugins: ["prettier-plugin-tailwindcss"],
};
